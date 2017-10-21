# SwiftControllerCommunicationLab
iOS ViewController 三種通訊方式Lab

1. delegate
   * FirstViewController 實作 Communicationdelegate Protocol
   * 將 SecondViewController 的 delegate 參考指定為 FirstViewController
   * SecondViewController 透過 delegate.notifyFirstClick 通知 FirstViewController
 
2. Key-Value Observing
   * 在 FirstViewController 實作 observeValue
   * 在 SecondViewController 設定 FirstViewController 為 觀察者
   * 異動屬性值，即會通知 FirstViewController 的 observeValue method
   
3. Notification
   * 在 FirstViewController 實作 receiveNotification 方法
   * 在 SecondViewController 設定 FirstViewController 為 通知接收者
   * 發送通知，即會通知 FirstViewController 的 receiveNotification method
