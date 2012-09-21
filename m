From: <gerg@snapgear.com>
Subject: [PATCH 00/11] m68knommu: clean up ColdFire Peripheral
	headers
Date: Fri, 21 Sep 2012 16:51:02 +1000
Message-ID: <1348210273-31246-1-git-send-email-gerg@snapgear.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
List-Id: linux-m68k@vger.kernel.org


This patch series is a bunch of cleanups and fixes across the ColdFire
periperhal header files. Primarily they are:

. fix mixed up uses of relative and absolute address
. convert hard coded addresses into proper definitions
. use consistent names for definitions across different ColdFire types
. remove unused definitions

This follows on from (and is meant to be applied on top of) the recent
series I sent that converts most base peripheral address definitions to be
absolute. The aim is to reduce the occurance of bugs that are mixing up
relative and absolute address definitions.

_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
