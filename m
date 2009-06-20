From: sfking@fdwdc.com
Subject: [PATCH 00/13] revised Coldfire generic GPIO
	(mk68nommu)
Date: Fri, 19 Jun 2009 18:10:59 -0700
Message-ID: <1245460272-4329-1-git-send-email-sfking@fdwdc.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Return-path: <uclinux-dev-bounces@uclinux.org>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: linux-kernel@vger.kernel.org
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
List-Id: linux-m68k@vger.kernel.org


Revised implementation of generic gpio for the Freescale Coldfire family of
processors (m68knommu).   It uses gpiolib and provides both fast inline
operations when the gpio is a compile time constant and slower outline
operations dispatched via gpiolib when the gpio is a variable. 

There are also hooks for implementing pin multiplexing but that part isn't
finished yet.


The major difference with the previous version is the move to a per-platform
setup code as suggested by Greg Ungerer <gerg@snapgear.com>.

Additionally, it fixes the definition of the TIMER gpio pins in the 5271
(thanks to Richard Retanubun <RichardRetanubun@ruggedcom.com>).
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
