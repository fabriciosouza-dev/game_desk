class CalculaLevelService
  def initialize(params)
    @new_ticket = params[:new_ticket]
    @old_ticket = params[:old_ticket]
    @new_comments = params[:new_comments]
    @old_comments = params[:old_comments]
  end

  def execute
    #regras do jogo
    # **Abertura de chamado 1 pontos
    # **Resolução do chamado 2 pontos
    # **Adicionou comentarios 1 ponto para cada comentario
    # **Se a prioridade for high e for resolvida:
    # no mesmo dia de criação 10 pontos
    # 1 dia depois 8 pontos
    # 2 a 7 dias 5 pontos
    # 8 a 30 dias 2 pontos
    # acima de 30 dias 1 ponto
    # **Se a prioridade for normal e for resolvida:
    # no mesmo dia de criação 5 pontos
    # 2 a 7 dias 3 pontos
    # 8 a 30 dias 1 pontos
    # acima de 30 dias 0 pontos
    # **Se a prioridade for baixa e for resolvida:
    # no mesmo dia de criação 2 pontos
    # 2 a 7 dias 1 pontos
    # acima 7 dias 0 pontos

    pontos = 0
    object_yield = UserBackoffice::Yield.find_or_create_by(requester_id: @new_ticket&.requester_id.to_i)
    # Novo ticket
    if @old_ticket[:created_at].to_s == @old_ticket[:updated_at].to_s && @new_ticket.status == 'solved'
      pontos += 1
    end
    pontos += 2 * @new_comments.size
    if @old_ticket[:status] == 'solved' && @new_ticket.flag_calc_level == 0
      pontos += 2
      case @new_ticket.priority
      when "urgent"
        pontos += condicional_type(@old_ticket[:updated_at].to_s.to_date, @new_ticket.created_at.to_s.to_date, "urgent")
      when "high"
        pontos += condicional_type(@old_ticket[:updated_at].to_s.to_date, @new_ticket.created_at.to_s.to_date, "high")
      when "normal"
        pontos += condicional_type(@old_ticket[:updated_at].to_s.to_date, @new_ticket.created_at.to_s.to_date, "normal")
      when "low"
        pontos += condicional_type(@old_ticket[:updated_at].to_s.to_date, @new_ticket.created_at.to_s.to_date, "low")
      else
        pontos += 0
      end
      if object_yield.present?
        if @new_ticket.xp.to_i == 0
          pontos_totais = object_yield&.xp + pontos
        else
          pontos_totais = object_yield&.xp + pontos - @new_ticket.xp
        end
        level = object_yield.level
        if pontos_totais > calcula_xp(level)
          object_yield.update(xp: pontos_totais, level: level + 1)
        else
          object_yield.update(xp: pontos_totais)
        end
      end
      @new_ticket.update(flag_calc_level: 1, xp: pontos)
    end

  end

  private

  def difference_two_dates(new_date, old_date)
    (new_date - old_date).to_i
  end

  def condicional_type(new_date, old_date, type)
    if new_date == old_date
      scale_of_points[type.to_sym][0]
    elsif difference_two_dates(old_date, new_date)
      scale_of_points[type.to_sym][1]
    elsif [2..7].include?(difference_two_dates(old_date, new_date))
      scale_of_points[type.to_sym][2]
    elsif [8..30].include?(difference_two_dates(old_date, new_date))
      scale_of_points[type.to_sym][3]
    else
      scale_of_points[type.to_sym][4]
    end
  end

  def scale_of_points
    {
      urgent: [15, 10, 8, 5, 0],
      high: [10, 8, 5, 1, 0],
      normal: [5, 3, 1, 0, 0],
      low: [2, 1, 0, 0, 0]
    }
  end

  def calcula_xp(level)
    (level / 0.07) ** 2
  end

end