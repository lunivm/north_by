#---
# Excerpted from "Modern Front-End Development for Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/nrclient for more book information.
#---
class CreateConcerts < ActiveRecord::Migration[6.1]
  def change
    create_enum(:enum_ilk, %w[concert meet_n_greet battle])
    create_enum(:enum_access, %w[general members vips])

    create_table(:concerts) do |t|
      t.string(:name)
      t.text(:description)
      t.datetime(:start_time)
      t.references(:venue, null: false, foreign_key: true)
      t.text(:genre_tags)
      t.enum(:ilk, enum_type: :enum_ilk)
      t.enum(:access, enum_type: :enum_access)

      t.timestamps
    end
  end
end
