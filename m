From: Greg Ungerer <gerg@snapgear.com>
Subject: [git pull] m68knommu arch fixes for 3.5
Date: Tue, 12 Jun 2012 14:10:13 +1000
Message-ID: <201206120410.q5C4ADGw020486@goober.corp.nai.org>
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
To: torvalds@linux-foundation.org
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, linux-kernel@vger.kernel.org, gerg@uclinux.org
List-Id: linux-m68k@vger.kernel.org

Hi Linus,

Can you plase pull the m68knommu git tree, for-linux branch:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-linus

It contains five fixes. Four fix build problems introduced by recent clean
up and merging of the m68k timer and ptrace code. The other fixes the 528x
ColdFire CPU QSPI base address definition, missed in the ColdFire QSPI
cleanup.

Thanks
Greg



The following changes since commit cfaf025112d3856637ff34a767ef785ef5cf2ca9:
  Linus Torvalds (1):
        Linux 3.5-rc2

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-linus

Greg Ungerer (4):
      m68k: fix inclusion of arch_gettimeoffset for non-MMU 68k classic CPU types
      m68knommu: fix 68328 local setting of timer interrupt handler
      m68knommu: fix 68360 local setting of timer interrupt handler
      m68k: make syscall_trace_enter/leave exist for non-MMU classic m68k types

Steven King (1):
      m68knommu: m528x qspi definition fix

 arch/m68k/include/asm/m528xsim.h  |    2 +-
 arch/m68k/kernel/ptrace.c         |    2 +-
 arch/m68k/kernel/time.c           |    4 ++--
 arch/m68k/platform/68328/timers.c |    6 ++++--
 arch/m68k/platform/68360/config.c |    7 +++++--
 5 files changed, 13 insertions(+), 8 deletions(-)
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
