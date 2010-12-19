#
# KWController.rb
# KeepWorking
#
# Created by Tom Lieber on 12/19/10.
# Copyright 2010 Tom Lieber. All rights reserved.
#

class KWController
  attr_accessor :text_field
  attr_accessor :status_bar_item
  attr_accessor :table_controller
  
  def initialize
    $controller = self
  end
  
  # sets the status bar item title, then hides the application
  def set_title title
    self.status_bar_item.title = title
    NSApplication.sharedApplication.hide(nil)
  end
  
  # get status bar item, creating it if it doesn't exist yet
  def status_bar_item
    @status_bar_item ||= NSStatusBar.systemStatusBar.statusItemWithLength(NSVariableStatusItemLength)
    @status_bar_item.target = self
    @status_bar_item.action = :"item_clicked:"
    @status_bar_item
  end
  
  # KWDataSource delegate
  
  def selected_item(item)
    text_field.stringValue = item
    text_field.selectText(nil)
  end
  
  # actions
  
  def clicked(sender)
    set_title text_field.stringValue
  end
  
  def item_clicked(sender)
    NSApplication.sharedApplication.activateIgnoringOtherApps(true)
  end
  
  def save_clicked(sender)
    table_controller.add(text_field.stringValue)
    text_field.stringValue = ""
    text_field.selectText(nil)
  end
end
