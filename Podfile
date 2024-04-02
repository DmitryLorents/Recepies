 platform :ios, '15.0'

 def shared_pods
    pod "Keychain"
end

target 'Recepies' do
  shared_pods
end

target 'RecipesMock' do
  	shared_pods
end

target 'RecepiesTests' do
    shared_pods
 end

target 'RecepiesUITests' do
    shared_pods
 end

   # inherit! :search_paths
   #  Pods for testing
 # end

#post_install do |installer|
 #   installer.generated_projects.each do |project|
  #      project.targets.each do |target|
   #         target.build_configurations.each do |config|
    #            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
     #       end
      #  end
    #end
#end