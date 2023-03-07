import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t2/homeViewModel.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // context.read<T> to just return T without listning ,
    // context.watch<T> to listen to any changes on T
    // context.select<T , R> listen to small part of T
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('test'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          const Text('data' , style: TextStyle(color: Colors.black , fontSize: 22 , fontWeight: FontWeight.bold),),
          const SizedBox(height: 20,),
          Expanded(
            // Consumer will update that widget bellow
            // Selector will update the widget only in specific selected values will changed
            child: Consumer<HomeViewModel>(
              builder: (context , homeViewModel , child){
                return ListView.builder(
                    itemCount: homeViewModel.list.length,
                    itemBuilder: (context , index){
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                        margin: const EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
                        color: Colors.black12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(homeViewModel.list[index] , style: const TextStyle(fontWeight: FontWeight.w400 , fontSize: 18),),
                            const SizedBox(width: 10,),
                            IconButton(onPressed: ()=>homeViewModel.delete(homeViewModel.list[index]), icon: const Icon(Icons.close))
                          ],
                        ),
                      );
                    });
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black26 , width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    autocorrect: true,
                    controller: context.read<HomeViewModel>().controller,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                       hintText: 'add item'
                    ),
                  ),
                ),
                CircleAvatar(
                    backgroundColor: Colors.amber,
                    child: IconButton(onPressed: ()=>context.read<HomeViewModel>().add(), icon: const Icon(Icons.add , color: Colors.black,)))
              ],
            ),
          )
        ],
      ),
    );
  }
}