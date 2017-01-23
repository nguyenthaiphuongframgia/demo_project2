module ApplicationHelper
  def full_title page_title
    base_title = t "app.helpers.application.base_title"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def get_image book, class_image = ""
    if book.image?
      image_tag book.image, class: class_image, size: Settings.size_image_book
    else
      image_tag "book1.png", class: class_image, size: Settings.size_image_book
    end
  end

  def get_image_user user, class_image = ""
    if user.avatar?
      image_tag user.avatar, class: class_image, size: Settings.size_image_avater
    else
      image_tag "avatar.png", class: class_image, size: Settings.size_image_avater
    end
  end

  def get_author id
    @name = Author.find_by id: id
    if @name.nil?

    else
      @name.name
    end
  end

  def generate_file_name file_name
    file_name + Time.now.strftime(Settings.format.date_time_format) + ".xls"
  end

  def group_by_user
    column_chart User.group_by_day(:created_at).count,
      height: '500px', library: {
      title: {text: 'Data User', x: -10},
      yAxis: {
        allowDecimals: false,
        title: {
          text: 'Count User'
        }
      },
      xAxis: {
        title: {
        text: 'Users'
        }
      }
    }
  end

  def group_by_book
    column_chart User.group_by_day(:created_at).count,
      height: '500px', library: {
      title: {text: 'Data Book', x: -10},
      yAxis: {
        allowDecimals: false,
        title: {
          text: 'Count Book'
        }
      },
      xAxis: {
        title: {
        text: 'Users'
        }
      }
    }
  end

  def link_to_remove_fields label, f
    field = f.hidden_field :_destroy
    link = link_to label, "#", onclick: "remove_fields(this)", remote: true
    field + link
  end

  def link_to_add_fields label, f, assoc
    new_obj = f.object.class.reflect_on_association(assoc).klass.new
    fields = f.fields_for assoc, new_obj, child_index: "new_#{assoc}" do |builder|
      render "admin/shared/#{assoc.to_s.singularize}_fields", f: builder
    end
    link_to label, "#", onclick: "add_fields(this, \"#{assoc}\",
      \"#{escape_javascript(fields)}\")", remote: true
  end
end
