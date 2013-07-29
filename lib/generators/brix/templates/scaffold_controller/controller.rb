# coding: UTF-8
class <%= controller_class_name %>Controller < <%= controller_class_name.include?('::') == true ? "#{controller_class_name.split('::').first}::" : ''  %>ApplicationController
  before_action :set_<%= file_name %>, only: [:show, :edit, :update, :destroy]
  
  def index
    @<%= plural_file_name %> = <%= file_name.camelize %>.paginate(page: params[:page])
  end

  def show
  end

  def new
    @<%= file_name %> = <%= orm_class.build(file_name.camelize) %>
  end

  def edit
  end

  def create
    @<%= file_name %> = <%= orm_class.build(file_name.camelize, "#{file_name}_params") %>

    respond_to do |format|
      if @<%= file_name %>.save
        format.html { redirect_to(<%= index_helper %>_path, :notice => '<%= human_name %> 创建成功。') }
        format.json
      else
        format.html { render :action => "new" }
        format.json
      end
    end
  end

  def update
    respond_to do |format|
      if @<%= file_name %>.update_attributes(<%= file_name %>_params)
        format.html { redirect_to(<%= index_helper %>_path, :notice => '<%= human_name %> 更新成功。') }
        format.json
      else
        format.html { render :action => "edit" }
        format.json
      end
    end
  end

  def destroy
    @<%= file_name %>.destroy

    respond_to do |format|
      format.html { redirect_to(<%= index_helper %>_path,:notice => "删除成功。") }
      format.json
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_<%= singular_table_name %>
      @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    end

    # Only allow a trusted parameter "white list" through.
    def <%= "#{singular_table_name}_params" %>
      <%- if attributes_names.empty? -%>
      params[<%= ":#{singular_table_name}" %>]
      <%- else -%>
      params.require(<%= ":#{singular_table_name}" %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
      <%- end -%>
    end
end
