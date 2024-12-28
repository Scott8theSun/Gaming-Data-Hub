package oldClasses;

import java.util.Date;

/**
 * Achievement class to represent the columns
 * in the achievement SQL table.
 */
public class PlayerAchievement {
        private Integer playerID;  //Primary key, Foreign key - Player(PlayerID)
        private Integer achievementID;  //Foreign key - Achievement(AchievementID)
        private Date unlockDate;

        public PlayerAchievement() {
                this.playerID = null;
                this.achievementID = null;
                this.unlockDate = null;
        }
        public PlayerAchievement(Integer playerID, Integer achievementID, Date unlockDate) {
                this.playerID = playerID;
                this.achievementID = achievementID;
                this.unlockDate = unlockDate;
        }
        /**
         * Getter Methods
         */
        public Integer getPlayerID() {
                return playerID;
        }
        public Integer getAchievementID() {
                return achievementID;
        }
        public Date getUnlockDate() {
                return unlockDate;
        }
        /**
         * Setter Methods
         */
        public void setPlayerID(Integer playerID) {
                this.playerID = playerID;
        }
        public void setAchievementID(Integer achievementID) {
                this.achievementID = achievementID;
        }
        public void setUnlockDate(Date unlockDate) {
                this.unlockDate = unlockDate;
        }
}
