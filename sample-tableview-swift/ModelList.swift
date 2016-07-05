import Foundation

class ModelList{
    
    var itemList:[ModelDetail] = []
    var sampleList = [ "apple" : [ "description" : "青森産とか長野県産とかあるね。", "img" : "apple.png" ],
                       "orange": [ "description" : "地中海性気候で出荷される",      "img": "orange.png"],
                       "lemon":  [ "description" : "かぼすじゃねー",              "img": "lemon.png"],
                       "melon":  [ "description" : "入院した時の手土産といえばこれ", "img": "melon.png"],
                       "banana": [ "description" : "そんなバナナ",                "img": "banana.png"]
                      ]
    
    init()
    {
        for ( key, value ) in sampleList
        {
            let model               = ModelDetail()
            model.detailTitle       = key
            model.detailDescription = value[ "description" ]
            model.detailImage       = value[ "img" ]
            model.detailCreateDatetime = NSDate()
            itemList.append( model )
        }
    }
    
    func addItem() ->Array<ModelDetail>
    {
        let i:Int                  = ( itemList.count % sampleList.count )
        var addDate                = sampleList[ Array( sampleList.keys )[ i ] ]!
        
        let model = ModelDetail()
        model.detailTitle          = Array( sampleList.keys )[ i ];
        model.detailDescription    = addDate[ "description" ];
        model.detailImage          = addDate[ "img" ];
        model.detailCreateDatetime = NSDate()
    
        itemList.append( model )
        return itemList;
    }
    
    func getList() -> Array<ModelDetail> {
        return itemList
    }
    
    func delItem( delNo : Int ) -> Array<ModelDetail>
    {
        itemList.removeAtIndex( delNo )
        return itemList;
    }


}