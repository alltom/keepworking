#
# KWDataSource.rb
# KeepWorking
#
# Created by Tom Lieber on 12/19/10.
# Copyright 2010 Tom Lieber. All rights reserved.
#

class KWDataSource
  attr_accessor :table
  attr_accessor :delegate
  
  def initialize
    @items = []
  end
  
  def awakeFromNib
    table.target = self
    table.doubleAction = :"remove:"
  end
  
  def add(text)
    @items << text
    table.reloadData
  end
  
  # actions
  
  def remove(sender)
    return unless delegate
    return if table.selectedRow < 0 || table.selectedRow >= @items.length
    
    item = @items.delete_at(table.selectedRow)
    table.reloadData
    delegate.selected_item(item)
  end
  
#  def add(sender)
#    @items << "Untitled"
#    table.reloadData
#    table.selectRow(@items.length - 1, byExtendingSelection:false)
#    table.editColumn(0, row:(@items.length - 1), withEvent:nil, select:true)
#  end
  
  # table view delegate methods
  
  def tableView(table, objectValueForTableColumn:column, row:row)
    @items[row]
  end
  
  def numberOfRowsInTableView(table)
    @items.length
  end
  
#  def tableView(table, setObjectValue:obj, forTableColumn:column, row:row)
#    @items[row] = obj
#  end
  
#  def tableView(table, writeRows:rows, toPasteboard:pboard)
#    pboard.writeObjects(rows.map { |r| @items[r] })
#  end
  
#  def tableView(table, validateDrop:info, proposedRow:row, proposedDropOperation:op)
#    puts "hey!"
#    op == NSTableViewDropAbove ? NSDragOperationMove : NSDragOperationNone
#  end
end
