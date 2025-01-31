# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.create!(title: "Design and Build Great Web APIs",
                description: %{
                   <p>
                     <em>Robust, Reliable, and Resilient</em>
                   </p>
                   <p>
                     APIs are transforming the business world at an increasing pace. Gain
                     the essential skills needed to quickly design, build, and deploy
                     quality web APIs that are robust, reliable, and resilient. Go from
                     initial design through prototyping and implementation to deployment of
                     mission-critical APIs for your organization. Test, secure, and deploy
                     your API with confidence and avoid the &ldquo;release into production&rdquo;
                     panic. Tackle just about any API challenge with more than a dozen
                     open-source utilities and common programming patterns you can apply
                     right away.
                   </p>
                 },
                image_url: "",
                price: 24.95)
