class OpportunitiesController < UIViewController
    
  MAINLABEL_TAG = 1
  SUBLABEL_TAG = 2
  
  def preferredStatusBarStyle; UIStatusBarStyleLightContent; end

  def viewDidLoad
    super

    self.title = "Opportunities"
    
    image = UIImage.imageNamed("header_photo.png")
    @header_image = UIImageView.alloc.initWithFrame([[0,0],[self.view.size.width, 168]])
    @header_image.image = image
    view.addSubview(@header_image)
    
    label = UILabel.alloc.init
    label.frame = [[11, 79], [300, 40]]
    label.font = UIFont.fontWithName("HelveticaNeue-Thin", size:18)
    label.text = "Peninsula School"
    label.textColor = UIColor.whiteColor
    @header_image.addSubview(label)

    label = UILabel.alloc.init
    label.frame = [[11, 100], [300, 40]]
    label.font = UIFont.fontWithName("HelveticaNeue-Thin", size:31)
    label.text = "Spring Fair 2015"
    label.textColor = UIColor.whiteColor
    @header_image.addSubview(label)

    green_bar = UIView.alloc.initWithFrame(CGRectMake(0, 150, 210, 18))
    green_bar.backgroundColor = BubbleWrap.rgb_color(8,255,31)
    green_bar.alpha = 0.5
    @header_image.addSubview(green_bar)

    red_bar = UIView.alloc.initWithFrame(CGRectMake(210, 150, 110, 18))
    red_bar.backgroundColor = BubbleWrap.rgb_color(255,0,0)
    red_bar.alpha = 0.5
    @header_image.addSubview(red_bar)

    label = UILabel.alloc.init
    label.frame = [[11, 150], [300, 18]]
    label.font = UIFont.fontWithName("HelveticaNeue-Thin", size:13)
    label.text = "63% of positions filled"
    label.textColor = UIColor.whiteColor
    @header_image.addSubview(label)

    @table = UITableView.alloc.initWithFrame(CGRectMake(0, 168, self.view.bounds.size.width, self.view.bounds.size.height-168))
    @table.dataSource = self
    @table.delegate = self
    @table.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
    @table.separatorColor = BubbleWrap.rgb_color(230,230,230)
    self.view.addSubview @table
    
    @data = []
    
    Opportunity.find_all do |result|
      p "Results"
      p result
      @data = result
      @table.reloadData
    end
  end
  
  def tableView(tableView, viewForHeaderInSection: section)
    view = UIView.alloc.initWithFrame(CGRectMake(0,0,tableView.frame.size.width, 48))
    
    label = UILabel.alloc.initWithFrame(CGRectMake(11,13, tableView.frame.size.width, 20))
    label.font = UIFont.fontWithName("HelveticaNeue-Thin", size:18)
    label.text = 'Help is still needed in:'
    label.textColor = BubbleWrap.rgb_color(255,3,3)
    view.addSubview(label)
    
    separator = UIView.alloc.initWithFrame(CGRectMake(0, 47, 320, 1))
    separator.backgroundColor = BubbleWrap.rgb_color(211,211,211)
    view.addSubview(separator)
    
    view.backgroundColor = UIColor.whiteColor
    return view
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"
    
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier)
    
    if cell.nil?
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
      cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
 
      main_label = UILabel.alloc.initWithFrame(CGRectMake(11,13, 180, 20))
      main_label.tag = MAINLABEL_TAG
      main_label.font = UIFont.fontWithName("HelveticaNeue-Thin", size:18)
      main_label.textColor = UIColor.blackColor
      cell.contentView.addSubview(main_label)

      sub_label = UILabel.alloc.initWithFrame(CGRectMake(181,13, 110, 20))
      sub_label.tag = SUBLABEL_TAG
      sub_label.font = UIFont.fontWithName("HelveticaNeue-Thin", size:12)
      sub_label.textColor = BubbleWrap.rgb_color(255,3,3)
      sub_label.textAlignment = UITextAlignmentRight;
      cell.contentView.addSubview(sub_label)
    else
      main_label = cell.viewWithTag(MAINLABEL_TAG)
      sub_label = cell.viewWithTag(SUBLABEL_TAG)
    end
 
    main_label.text = @data[indexPath.row].title
    sub_label.text = "#{@data[indexPath.row].number_of_positions}0 positions available"

    cell
  end

  def tableView(tableView, numberOfRowsInSection: section); @data.count; end
  def tableView(tableView, heightForRowAtIndexPath:indexPath); 48; end
  def tableView(tableView, heightForHeaderInSection: section); 48; end
  def numberOfSectionsInTableView(tableView); 1; end
  
  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  end
end

