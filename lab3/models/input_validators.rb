# frozen_string_literal: true

# Validators for the incoming requests
module InputValidators
  def self.check_book(raw_autor, raw_title, raw_date)
    autor = raw_autor || ''
    title = raw_title || ''
    date = raw_date || ''
    errors = [].concat(check_title(title))
               .concat(check_autor(autor))
               .concat(check_date(date))
               .concat(check_date_format(date))
    {
      autor: autor,
      title: title,
      date: date,
      errors: errors
    }
  end

  def self.check_date_format(date)
    if /\d{4}-\d{2}-\d{2}/ =~ date
      date_hash = Date._parse(date.to_s)
      if Date.valid_date?(date_hash[:year].to_i, date_hash[:mon].to_i, date_hash[:mday].to_i)
        []
      else
        ['it is not a date']
      end
    else
      ['The date must be in the format YYYY-MM-DD']
    end
  end

  def self.check_autor(autor)
    if autor.empty?
      ['The autor can not be empty']
    else
      []
    end
  end

  def self.check_title(title)
    if title.empty?
      ['The title can not be empty']
    else
      []
    end
  end

  def self.check_date(date)
    if date.empty?
      ['The date can not be empty']
    else
      []
    end
  end
end
