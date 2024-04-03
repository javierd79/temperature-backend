# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Device.create(model: 'DHT11', is_active: true, token: "df0b8765-a111-44d2-946f-9e6644df985b")

Archive.create(current: Date.yesterday, device_token: "df0b8765-a111-44d2-946f-9e6644df985b")