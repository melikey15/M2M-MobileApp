const { DataTypes, Sequelize  } = require('sequelize');

const sequelize = require('../database');
////////////////////resim için eklenen yeni kısım//////////////////////////
var fs = require('fs');
function base64_encode(file) {
  
  var bitmap = fs.readFileSync(file);
    
    return new Buffer(bitmap).toString('base64');
}


function base64_decode(base64str, file) {
    
    var bitmap = new Buffer(base64str, 'base64');
    
    fs.writeFileSync(file, bitmap);
    console.log('******** File created from base64 encoded string ********');
}

// convert image to base64 encoded string
var base64str = base64_encode('src/models/default_m2m.jpg');
console.log(base64str);
// convert base64 string back to image 
base64_decode(base64str, 'copy_default_m2m.jpg');


const User =  sequelize.define('user_table', {
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  surname: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  password: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  user_role: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },

  avatar: {

    type: DataTypes.STRING(10000000),
    defaultValue: base64str,
    allowNull: true

  },

  ratingAverage: {
    type: DataTypes.DOUBLE,
    defaultValue: 0,
    allowNull: true
  },
  
  rating: {
    
    type: Sequelize.ARRAY(Sequelize.INTEGER),
    defaultValue: [],
    allowNull: true

  },
  avatar: {

    type: DataTypes.STRING(10000000),
    defaultValue: base64str,
    allowNull: true

  },

  about_me:{
    type: DataTypes.STRING(1000),
    defaultValue:'',
    allowNull:true

  },
  city:{

    type: DataTypes.STRING,
    defaultValue:'',
    allowNull:true
  },

  

  

  work:{

    type: DataTypes.STRING,
    defaultValue:'',
    allowNull : true

  }


  
});

const Role = sequelize.define('role_table', {

  role_name: {
    type: DataTypes.STRING,
    allowNull: false,
  }
});

const USER_HAS_ROLE = sequelize.define('user_has_role', {

    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    }
  });





  const TAG_TABLE = sequelize.define('tag_table', {
  
    tag_name:{
        type: DataTypes.STRING,
        allowNull: false,
      },
    
  });
  
  const USER_HAS_TAG = sequelize.define('user_has_tags', {
      id:{
        type: DataTypes.INTEGER,
        allowNull: false,
        primaryKey: true,
        autoIncrement: true
      },
     user_id:{
        type: DataTypes.INTEGER,
        allowNull: false,
        references:{
          model:'user_table',
          key:'id'
  
        }
       
      },
      tag_id:{
        type: DataTypes.INTEGER,
       allowNull: false,
       references:{
  
        model:'tag_table',
        key:'id'
  
       }
        
      },
  })
  


const MENTOR_MENTEE_REL = sequelize.define('mentor_mentee_rel', {
  id:{
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
  },
  user_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'user_tables',
      key: 'id',
    },
  },
  rel_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'user_tables',
      key: 'id',
    },
  },
})




const Comments = sequelize.define('comment_table', {
  
  comment_content:{
    type: DataTypes.STRING,
    defaultValue:'',
    allowNull: false,
   
  },
  owner_id:{
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: false,
    
  },
  author_id:{
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: false,
    
  },
  
 
})

const Owner_Has_Comments = sequelize.define('owner_has_comment', {
  id:{
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: true
  },
  user_comment_id:{
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: false
  },
  user_id:{
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: false,
    
  },
 
})

const Meetings = sequelize.define('meet_table',{
  mentee_id:{
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  meeting_date:  {
    type: DataTypes.DATE,
    allowNull: false,
    
  },
  start_time: {
    type: DataTypes.TIME,
    allowNull: false,
   
  },
  end_time: {
    type: DataTypes.TIME,
    allowNull: false,
    
  },
  
  message: {
    type: DataTypes.STRING,
    allowNull:false,
    defaultValue:""
  },
  createdById:{
    type:DataTypes.INTEGER,
    allowNull:false,
  }
});

const USER_HAS_Meetings = sequelize.define('user_has_meeting', {
  id:{
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: true
  },
  user_meeting_id:{
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: false
  },
  user_id:{
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: false,
    
  },
 
})

Meetings.belongsToMany(User,{
  through: "user_has_meeting",
  as:"User",
  foreignKey: "user_meeting_id",

})
User.belongsToMany(Meetings,{
  through: "user_has_meeting",
  as:"Meetings",
  foreignKey: "user_id",

})
Meetings.belongsTo(User, { as: 'mentees', foreignKey: 'mentee_id'});
Meetings.belongsTo(User, { as: 'mentor', foreignKey: 'createdById'});
User.hasMany(Meetings);

  MENTOR_MENTEE_REL.belongsTo(User, { as: 'myMentors', foreignKey: 'rel_id'});
  MENTOR_MENTEE_REL.belongsTo(User, { as: 'myMentees', foreignKey: 'user_id'});
  User.hasMany(MENTOR_MENTEE_REL);

  ////////////////////////////////////////////////
  Comments.belongsToMany(User,{
    through: "owner_has_comment",
    as:"User",
    foreignKey: "user_comment_id",

  })
  User.belongsToMany(Comments,{
    through: "owner_has_comment",
    as:"comment_table",
    foreignKey: "user_id",

  })
  Comments.belongsTo(User, { as: 'author_comments', foreignKey: 'author_id'});
  Comments.belongsTo(User, { as: 'owner_comments', foreignKey: 'owner_id'});
  User.hasMany(Comments);
  ///////////////////////////////////////////////////////

  Role.hasMany(User, {
    foreignKey: 'user_role'
  });
  User.hasMany(USER_HAS_ROLE, {
    foreignKey: 'user_id'
  });
  Role.hasMany(USER_HAS_ROLE, {
    foreignKey: 'role_id'
  });
  /////////////////////////////////////////////////

  User.belongsToMany(TAG_TABLE,{
    through: "user_has_tags",
    as:"TAG_TABLE",
    foreignKey:"user_id",
  });

  TAG_TABLE.belongsToMany(User,{
    through: "user_has_tags",
    as:"User",
    foreignKey:"tag_id",
  });

  
  USER_HAS_TAG.belongsTo(User,{as:'user_tag',foreignKey:'user_id'});
  User.hasMany(USER_HAS_TAG);
  USER_HAS_TAG.belongsTo(TAG_TABLE,{as:'tag_tag',foreignKey:'tag_id'});
  TAG_TABLE.hasMany(USER_HAS_TAG);
  ///////////////////////////////////////////
  Meetings.belongsToMany(User,{
    through: "user_has_meeting",
    as:"user_table",
    foreignKey: "user_meeting_id",

  })
  User.belongsToMany(Meetings,{
    through: "user_has_meeting", 
    as:"user_table",
    foreignKey: "user_id",
  }
  )
/////////////////favoriiii
  const Mentee_fav_mentor = sequelize.define('mentee_Favs', {
    id:{
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'user_tables',
        key: 'id',
      },
    },
    fav_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'user_tables',
        key: 'id',
      },
    },
  })
  Mentee_fav_mentor.belongsTo(User, { as: 'favMentors', foreignKey: 'fav_id'});
  User.hasMany(Mentee_fav_mentor);
/////////// end favori

  sequelize.sync({ alter: true });



module.exports={Role, User, USER_HAS_ROLE, TAG_TABLE, USER_HAS_TAG, MENTOR_MENTEE_REL,Meetings,USER_HAS_Meetings,Comments,Owner_Has_Comments,Mentee_fav_mentor};

