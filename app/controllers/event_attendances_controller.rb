class EventAttendancesController < ApplicationController
  before_action :authenticate_user!
  def show
    @event_attendance = EventAttendance.find(params[:id])
  end

  # POST /events or /events.json
  def create
    @event_attendance = current_user.event_attendances.build(event_attendance_params)
    respond_to do |format|
      if @event_attendance.save
        format.html { redirect_to root_path, notice: 'You will attend this event' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render root_path, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def event_attendance_params
    params.require(:event_attendance).permit(:attended_event_id, :attendee_id)
  end
end
