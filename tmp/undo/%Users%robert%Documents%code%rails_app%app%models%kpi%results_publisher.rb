Vim�UnDo� ��uEzl.^�G�u��X2}�-`z�5%��M   �     rescue Garb::ClientError   &                          TYM    _�                     #       ����                                                                                                                                                                                                                                                                                                                                                             TR�%    �   #   &   �          �   $   %   �    �   #   %   �    5�_�                   $        ����                                                                                                                                                                                                                                                                                                                                                             TR��    �   #   $              rescue Garb::BackendError5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             TR��    �         �          �         �    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             TR��     �                    raise Garb::BackendError5�_�                    $       ����                                                                                                                                                                                                                                                                                                                                                             TR�     �   $   &   �          # �   $   &   �    5�_�                    %       ����                                                                                                                                                                                                                                                                                                                                                             TR�    �   $   &   �        rescue Garb::BackendError5�_�      	              %       ����                                                                                                                                                                                                                                                                                                                                                             TR��    �   $   &   �          rescue Garb::BackendError5�_�      
           	   %       ����                                                                                                                                                                                                                                                                                                                                                             TR��    �   $   &   �          #rescue Garb::BackendError5�_�   	              
   $        ����                                                                                                                                                                                                                                                                                                                                                             TR�     �   #   $          E    # Transient error on Google's end. Ignore and try again tomorrow.5�_�   
                 $       ����                                                                                                                                                                                                                                                                                                                                                             TR�     �   $   &   �    �   $   %   �    5�_�                    %       ����                                                                                                                                                                                                                                                                                                                                                             TR�	     �   $   &   �      E    # Transient error on Google's end. Ignore and try again tomorrow.5�_�                    %       ����                                                                                                                                                                                                                                                                                                                                                             TR�     �   $   &   �      G      # Transient error on Google's end. Ignore and try again tomorrow.5�_�                    $       ����                                                                                                                                                                                                                                                                                                                                                             TR�   	 �   #   %   �          rescue Garb::BackendError5�_�                    $       ����                                                                                                                                                                                                                                                                                                                                                             TR��     �               �   class Kpi::ResultsPublisher     QUERY_NAMES = %w(       active_user_growth       prospects_growth       user_growth       new_paid_account_growth       new_users_by_segment       new_user_growth_by_segment        new_paid_accounts_by_segment   &    new_paid_account_growth_by_segment       revenue_growth_by_segment   !    revenue_by_segment_highcharts       revenue_growth       new_order_revenue_growth       retained_revenue_growth       revived_revenue_growth       revenue_mix       revenue_mix_percentages       retention_rate   !    authenticated_users_over_time   %    polls_updated_in_the_last_30_days   '    results_created_in_the_last_30_days     )         def publish   5    # needed for active_user_growth, prospects_growth   &    Analytic.login_to_google_analytics       '    DatabaseConnection.with_slave_db do   %      QUERY_NAMES.each do |queryname|   +        results_data = self.send(queryname)   &        filename = queryname + ".json"   5        Kpi::S3Uploader.write(filename, results_data)   	      end       end     rescue Garb::BackendError   E    # Transient error on Google's end. Ignore and try again tomorrow.     end       	  private         def active_user_growth   )    Kpi::ActiveUserGrowth.new.values_json     end         def prospects_growth   (    Kpi::ProspectsGrowth.new.values_json     end         def user_growth   #    Kpi::UserGrowth.new.values_json     end         def new_paid_account_growth   (    Kpi::NewPaidAccounts.new.values_json     end         def new_users_by_segment   -    new_users_by_segment_instance.values_json     end          def new_user_growth_by_segment   -    new_users_by_segment_instance.growth_json     end       #  def new_users_by_segment_instance   A    @new_users_by_segment_instance ||= Kpi::NewUsersBySegment.new     end       "  def new_paid_accounts_by_segment   5    new_paid_accounts_by_segment_instance.values_json     end       (  def new_paid_account_growth_by_segment   5    new_paid_accounts_by_segment_instance.growth_json     end       +  def new_paid_accounts_by_segment_instance   P    @new_paid_accounts_by_segment_instance ||= Kpi::NewPaidAccountsBySegment.new     end         def revenue_growth_by_segment   +    revenue_by_segment_instance.growth_json     end       #  def revenue_by_segment_highcharts   +    revenue_by_segment_instance.values_json     end       !  def revenue_by_segment_instance   >    @revenue_by_segment_instance ||= Kpi::RevenueBySegment.new     end         def revenue_growth   &    Kpi::RevenueGrowth.new.values_json     end         def new_order_revenue_growth   .    Kpi::NewOrderRevenueGrowth.new.values_json     end         def retained_revenue_growth   .    Kpi::RetainedRevenueGrowth.new.values_json     end         def revived_revenue_growth   -    Kpi::RevivedRevenueGrowth.new.values_json     end         def revenue_mix   $    revenue_mix_instance.values_json     end         def revenue_mix_percentages   )    revenue_mix_instance.percentages_json     end         def revenue_mix_instance   1    @revenue_mix_instance ||= Kpi::RevenueMix.new     end         def retention_rate   &    Kpi::RetentionRate.new.values_json     end       #  def authenticated_users_over_time   +    Kpi::AuthenticatedUsers.new.values_json     end       '  def polls_updated_in_the_last_30_days   -    poll_data = Kpi::PollsRecentlyUpdated.new       poll_data.process!       poll_data.to_chart_json     end       )  def results_created_in_the_last_30_days   2    results_data = Kpi::ResultsRecentlyCreated.new       results_data.process!       results_data.to_chart_json     end   end5�_�                    %        ����                                                                                                                                                                                                                                                                                                                                                             TYL)     �   %   (   �          # �   %   '   �    5�_�                    '       ����                                                                                                                                                                                                                                                                                                                                                             TYL�     �   &   (   �          # Error returned from GA.5�_�                    '       ����                                                                                                                                                                                                                                                                                                                                                             TYL�     �   &   '          '    # Transient error returned from GA.5�_�                    %       ����                                                                                                                                                                                                                                                                                                                                                             TYL�     �   $   %          E    # Transient error on Google's end. Ignore and try again tomorrow.5�_�                    %       ����                                                                                                                                                                                                                                                                                                                                                             TYL�     �   %   '   �    �   %   &   �    5�_�                    $       ����                                                                                                                                                                                                                                                                                                                                                             TYL�   
 �   $   &   �    �   $   %   �    5�_�                    &       ����                                                                                                                                                                                                                                                                                                                                                             TYM[    �   %   '   �        rescue Garb::ClientError5�_�                     &       ����                                                                                                                                                                                                                                                                                                                                                             TYM~    �   %   '   �        #rescue Garb::ClientError5�_�                    $        ����                                                                                                                                                                                                                                                                                                                                                             TR��    �   #   %        5��