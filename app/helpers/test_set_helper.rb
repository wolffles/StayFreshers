module TestSetHelper
#  <% apartment = Apartment.new %>
# ...
# <%= carousel_for(apartment.image_urls) %>

def carousel_for(ts_array)
  Carousel.new(self, ts_array).html
end

class Carousel
  def initialize(view, ts_array)
    @view, @ts_array = view, ts_array
    @uid = SecureRandom.hex(6)
  end

  def html
    content = view.safe_join([indicators, slides, controls])
    view.content_tag(:div, content, class: 'carousel slide')
   end

private

   attr_accessor :view, :ts_array, :uid
   delegate :link_to, :content_tag, :safe_join, :render, to: :view

   def indicators
     items = ts_array.count.times.map { |index| indicator_tag(index) }
     content_tag(:ol, safe_join(items), class: 'carousel-indicators')
   end

   def indicator_tag(index)
     options = {
       class: (index.zero? ? 'active' : ''),
         data: {
           target: uid,
           slide_to: index
         }
     }

     content_tag(:li, '', options)
   end

   def slides
     items = ts_array.map.with_index { |ts_object, index| slide_tag(ts_object,index.zero? ) }
     content_tag(:div, safe_join(items), class: 'carousel-inner' )
   end

   def slide_tag(ts_object, is_active)
     options = {
       class: (is_active ? 'item active' : 'item' ),
     }
     content_tag(:div, options) do
      #  if ts_object.class == Flashcard
      #   render :partial => "ts_flashcard", locals: {flashcard: ts_object}
      # elsif ts_object.class == MultipleChoice
      #   render :partial => "ts_multiple_choice", locals: {multiple_choice: ts_object}
      # elsif ts_object.class ==  TrueFalse
      #   render :partial => "ts_true_false", locals: {true_false: ts_object}
      # end
      "blah"
    end
   end

   def controls
     safe_join([control_tag('left'), control_tag('right')])
   end

   def control_tag(direction)
     options = {
       class: "#{direction} carousel-control",
         data: {slide: direction == 'left' ? 'prev' : 'next' }
     }

     icon = content_tag(:i, nil, class: "glyphicon glyphicon-chevron-#{direction}")
     control = link_to(icon, "##{uid}", options)
   end
 end
end
