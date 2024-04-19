# frozen_string_literal: true
class PagesController < ApplicationController
    def index
        @fights = Fight.all.order(created_at: :desc).limit(5)
    end
end
