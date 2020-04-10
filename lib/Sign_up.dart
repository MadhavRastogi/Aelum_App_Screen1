import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assignment1/constants.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  String _profile="",_day="Day",_month="Month",_year="Year",gen='',tong='',prf='',reg='',loc='';
  final List<String> prof= ['Select', 'Internship' ,'Job' ];
  final List<String> genders =['Select','M','F'];
  final List<String> religion =['Select','Hindu','Muslim','Christian','Sikh'];
  final List<String> tongue =['Select','Hindi','English','Spanish'];
  final List<String> locs =['India','USA','Australia'];
  final List<String> days =['Day','1','2','3','4','5','6','7','8','9','10'];
  final List<String> months =['Month','Jan','Feb','Mar','Apr','May','June','July','Aug','Sep','Oct','Nov','Dec'];
  final List<String> years =['Year','1986','1987','1988','1989','1990'];




  // text field state
  String email = "", password = "", valid = "";

  Widget _buildListWidget_ddmmyy(String input) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Container(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0,10.0,20.0,0),
                child:Column(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '$input',
                          style: TextStyle(fontSize: 15.0),
                        )
                    ),
                    Container(
                      child: DropdownButtonFormField(
                        decoration: textInputDecoration,
                        value: _day ?? days[0],
                        onChanged: (val) => setState(() => _day = val),
                        items: days.map((pro) {
                          return DropdownMenuItem(
                            value: pro,
                            child: Text('$pro'),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                )
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            padding: EdgeInsets.only(right: 20.0),
            child: DropdownButtonFormField(
              decoration: textInputDecoration,
              value: _month ?? months[0],
              onChanged: (val) => setState(() => _month = val),
              items: months.map((pro) {
                return DropdownMenuItem(
                  value: pro,
                  child: Text('$pro'),
                );
              }).toList(),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            padding: EdgeInsets.only(right: 20.0),
            child: DropdownButtonFormField(
              decoration: textInputDecoration,
              value: _year ?? years[0],
              onChanged: (val) => setState(() => _year = val),
              items: years.map((pro) {
                return DropdownMenuItem(
                  value: pro,
                  child: Text('$pro'),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListWidget_dd(String input , List<String> lists , String lambda) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0,10.0,20.0,0),
      child:Column(
        children: <Widget>[
          Container(
              alignment: Alignment.topLeft,
              child: Text(
                  '$input',
                style: TextStyle(fontSize: 17.0),
              )
          ),
          SizedBox(height: 5.0,),
          Container(
            child: DropdownButtonFormField(
              decoration: textInputDecoration,
              value: lists[0],
              onChanged: (val) => setState(() => lambda = val),
              items: lists.map((pro) {
                return DropdownMenuItem(
                  value: pro,
                  child: Text('$pro'),
                );
              }).toList(),
            ),
          ),
        ],
      )
    );
  }

  Widget _buildListWidget1(String input) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0,10.0,20.0,0),
      child: Column(
          children: <Widget>[
            Container(
                alignment: Alignment.topLeft,
                child: Text(
                    '$input',
                    style: TextStyle(
                      fontSize: 17.0
                    ),
                )
            ),
            SizedBox (height: 5.0,),
            TextFormField(
              decoration: textInputDecoration,
              validator: (val) => val.length < 6? 'Enter stronger password': null,
              onChanged: (val) {
                setState(() => password = val);
              },
            ),
          ]
      ),
    );
  }



  Widget _buildListWidget(String input) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0,10.0,20.0,0),
      child: Column(
         children: <Widget>[
           Container(
               alignment: Alignment.topLeft,
               child: Text(
                   '$input',
                 style: TextStyle(
                     fontSize: 17.0,
                 ),
               )
           ),
          SizedBox(height: 5.0,),
          TextFormField(
           decoration: textInputDecoration,
          validator: (val) => val.length < 6? 'Enter valid credentials': null,
          onChanged: (val) {
            setState(() => email = val);
              },
             ),
             ]
        ),
    );
  }

  Widget _buildListWidget_Submit() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0,40.0,20.0,40.0),
      child: Container(
        child: RaisedButton(
            color: Colors.lightBlueAccent,
            child: Text(
                'Submit',
                style: TextStyle(
                    fontSize: 20.0 ,
                    color: Colors.white
                )
            ),
            onPressed: (){
              /*if (_formKey.currentState.validate()) {
                setState(() {
                  loading = false;
                  valid = 'Successfully Registered';
                });
              }*/
            }
        ),
      ),
    );
  }


  Widget _normtext(){
    return Column(
       children: <Widget>[
         Center(child: Text('By submitting you agree to our')),
         SizedBox(height: 2.0),
         Padding(
           padding: const EdgeInsets.fromLTRB(125.0,0,120.0,0),
           child: Row(
             children: <Widget>[
               Text(
                   'Privacy Policy ',
                   style: TextStyle(color: Colors.lightBlueAccent),
               ),
               Text('and '),
               Text(
                   'T&C',
                   style:TextStyle(color: Colors.lightBlueAccent),
               )
             ],
           ),
         )

       ],
    );
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[300],
       appBar: AppBar(
         backgroundColor: Colors.grey[100],
         title: Container(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/logo.jpg'),
            ),
         ),
         actions: <Widget>[
           Container(
               alignment:Alignment.center ,
               child: Text('Login',style:TextStyle(fontSize:17.0,color: Colors.lightBlueAccent),)),
           FlatButton.icon(
               onPressed: (){},
               icon: Container(
                  alignment: Alignment.centerRight,
                   child: Icon(Icons.chevron_right),
               ),
             label: Text('')
           )
         ],
       ),
       body: CustomScrollView(
         slivers: <Widget>[
           SliverAppBar(
             stretch: true,
             title: Text('Welcome',style: TextStyle(color: Colors.grey[700],fontSize: 30.0),),
             centerTitle: true,
             backgroundColor: Colors.grey[200],
             expandedHeight: 200,
             flexibleSpace: FlexibleSpaceBar(
                title:Text('SIGN UP FREE',style: TextStyle(color: Colors.grey[700],fontSize: 20.0),),
               centerTitle: true,
             ),
           ),
           SliverFixedExtentList(
             itemExtent: 150,
             delegate: SliverChildListDelegate(
               [
                 _buildListWidget('Email'),
                 _buildListWidget1('Password'),
                 _buildListWidget_dd('Profile for' , prof, prf),
                 _buildListWidget('First Name'),
                 _buildListWidget('Last Name'),
                 _buildListWidget_dd('Gender' , genders , gen),
                 _buildListWidget_ddmmyy('Date of Birth'),
                 _buildListWidget_dd('Religion' , religion , reg),
                 _buildListWidget_dd('Mother tongue' , tongue , tong),
                 _buildListWidget_dd('Living In' , locs ,loc),
                 _buildListWidget_Submit(),
                 _normtext(),
               ]
             ),
           )
         ],
       ),
    );

  }
}
