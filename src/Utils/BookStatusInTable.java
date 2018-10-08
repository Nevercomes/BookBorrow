package Utils;

import global.BookStatus;

public class BookStatusInTable {
    public static BookStatus getBookStatus(int status) {
        switch (status) {
            case 0:
                return BookStatus.FREE;
            case 1:
                return BookStatus.NONE;
            case 2:
                return BookStatus.BORROWED;
            case 3:
                return BookStatus.REQUESTING;
            case 4:
                return BookStatus.BORROWING;
            case 5:
                return BookStatus.DENIED;
            case 6:
                return BookStatus.OVER;
            case 7:
                return BookStatus.REQUESTED;
            case 8:
                return BookStatus.LENDING;
            case 9:
                return BookStatus.CONFIRMING;
            default:
                return null;
        }
    }

    public static int getIntForBookStatus(BookStatus status) {
        switch (status) {
            case FREE:
                return 0;
            case NONE:
                return 1;
            case BORROWED:
                return 2;
            case REQUESTING:
                return 3;
            case BORROWING:
                return 4;
            case DENIED:
                return 5;
            case OVER:
                return 6;
            case REQUESTED:
                return 7;
            case LENDING:
                return 8;
            case CONFIRMING:
                return 9;
            default: // 默认无书
                return 1;
        }
    }
}
