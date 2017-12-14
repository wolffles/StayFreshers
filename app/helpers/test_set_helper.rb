module TestSetHelper
#  <% apartment = Apartment.new %>
# ...
# <%= carousel_for(apartment.image_urls) %>

def slideshow_for(ts_array)
  Carousel.new(self, ts_array).html
end


class Carousel
  def initialize(view, ts_array)
    @view, @ts_array = view, ts_array
  end

  def html
    content = view.safe_join( [slides, indicators] )
    view.content_tag(:div, content, class: nil)
   end

private

   attr_accessor :view, :ts_array
   delegate :content_tag, :safe_join, :render, :raw, to: :view


   def slides
     items = ts_array.map.with_index { |ts_object, index| slide_tag(ts_object, index) }
     items.push(
       content_tag(:div, class: "mySlides") do
        safe_join([
          content_tag(:div, "end", class: "numbertext"),
          (render :partial => "submit", locals: {ts_array: ts_array})
        ])
      end
     )
     items << content_tag(:a, raw("&#10094;"), class: "prev", onclick: "plusSlides(-1)" )
     items << content_tag(:a, raw("&#10095;"), class: "next", onclick: "plusSlides(1)" )
     items << raw("<br>")
    content_tag(:div, safe_join(items), class: 'slideshow-container')
   end

   def slide_tag(ts_object, index)
     content_tag(:div, class: "mySlides") do
       if ts_object.class == Flashcard
        safe_join([
          content_tag(:div, "#{index} / #{ts_array.size}", class: "numbertext"),
          (render :partial => "ts_flashcard", locals: {flashcard: ts_object, index: index})
        ])
      elsif ts_object.class == MultipleChoice
        safe_join([
          content_tag(:div, "#{index} / #{ts_array.size}", class: "numbertext"),
          (render :partial => "ts_multiple_choice", locals: {multiple_choice: ts_object,index: index})
        ])
      elsif ts_object.class ==  TrueFalse
        safe_join([
          content_tag(:div, "#{index} / #{ts_array.size}", class: "numbertext"),
          (render :partial => "ts_true_false", locals: {true_false: ts_object,index: index})
        ])
      end
    end
   end
   def indicators
    ts_array<<''
    items = ts_array.count.times.map { |index| indicator_tag(index) }
    content_tag(:div, safe_join(items), class: nil, style: "text-align: center")
   end

   def indicator_tag(index)
     content_tag(:span, "", class: "dot",
       onclick: "currentSlide(#{index+1})")
   end
 end
end
