#
# NSApplication.rb
# KeepWorking
#
# Created by Tom Lieber on 12/19/10.
# Copyright 2010 Smule, Inc. All rights reserved.
#

class NSApplication
  attr_accessor :currentAction
  
  def setCurrentAction(val)
    $controller.set_title(val)
  end
end
