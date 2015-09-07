From: Greg Ungerer <gerg@uclinux.org>
Subject: [git pull] m68knommu/coldfire fixes for 4.3
Date: Mon, 7 Sep 2015 11:56:02 +1000
Message-ID: <55ECEEB2.1010504@uclinux.org>
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
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, uClinux development list <uclinux-dev@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

Hi Linus,

Can you please pull the m68knommu git tree, for-next branch.
Only a couple of patches this time. One migrating the clock driver code
to the new set-state interface. The other cleaning up to use the PFN_DOWN
macro.

Regards
Greg



The following changes since commit c13dcf9f2d6f5f06ef1bf79ec456df614c5e058b:

  Linux 4.2-rc8 (2015-08-23 20:52:59 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next

for you to fetch changes up to 50e48bd0673180311874d0c1bd88505eefd75c4e:

  m68k/coldfire: use PFN_DOWN macro (2015-08-24 14:31:38 +1000)

----------------------------------------------------------------
Alexander Kuleshov (1):
      m68k/coldfire: use PFN_DOWN macro

Viresh Kumar (1):
      m68k/coldfire/pit: Migrate to new 'set-state' interface

 arch/m68k/coldfire/m54xx.c |  9 ++++---
 arch/m68k/coldfire/pit.c   | 66 +++++++++++++++++++++-------------------------
 2 files changed, 35 insertions(+), 40 deletions(-)
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
