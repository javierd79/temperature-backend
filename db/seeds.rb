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

Log.create(degree: "C", humidity: "70.3", temperature: "30.7", thermal_sensation: "32.1", archive_id: 1, device_id: 1, created_at: Time.now - 1.day + 90.minutes, updated_at: Time.now - 1.day + 90.minutes)
Log.create(degree: "C", humidity: "65.6", temperature: "31.2", thermal_sensation: "33.2", archive_id: 1, device_id: 1, created_at: Time.now - 1.day + 60.minutes, updated_at: Time.now - 1.day + 60.minutes)
Log.create(degree: "C", humidity: "67.1", temperature: "31.6", thermal_sensation: "33.5", archive_id: 1, device_id: 1, created_at: Time.now - 1.day + 30.minutes, updated_at: Time.now - 1.day + 30.minutes)