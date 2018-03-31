From: Eugene Syromiatnikov <esyr@redhat.com>
Subject: Re: [GIT PULL] siginfo fix for v4.16-rc5
Date: Sat, 31 Mar 2018 12:56:58 +0200
Message-ID: <20180331105658.GA4332@asgard.redhat.com>
References: <87woypy8zc.fsf@xmission.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87woypy8zc.fsf@xmission.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

On Tue, Mar 06, 2018 at 01:11:03AM -0600, Eric W. Biederman wrote:
> Linus,
> 
> Please pull the siginfo-linus branch from the git tree:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.git siginfo-linus
> 
>    HEAD: f6a015498dcaee72f80283cb7873d88deb07129c signal/x86: Include the field offsets in the build time checks
> 
> The kbuild test robot found that I accidentally moved si_pkey when I was
> cleaning up siginfo_t.  A short followed by an int with the int having 8
> byte alignment.  Sheesh siginfo_t is a weird structure.
> 
> I have now corrected it and added build time checks that with a little
> luck will catch any similar future mistakes.  The build time checks were
> sufficient for me to verify the bug and to verify my fix.  So they are
> at least useful this once.
> 
> Eric W. Biederman (2):
>       signal: Correct the offset of si_pkey in struct siginfo

Looks like this commit changes layout of the siginfo struct on m68k:

pts/0, esyr@fedora: /tmp % cat si.c
#include <stddef.h>
#include "linux/signal.h"

static const size_t lower_offset = offsetof(struct siginfo, si_lower);
pts/0, esyr@fedora: /tmp % m68k-linux-gnu-gcc -Ikhdr-v4.16-rc1\~159\^2\~20/include -g -c si.c -o si-orig.o
pts/0, esyr@fedora: /tmp % m68k-linux-gnu-gcc -Ikhdr-v4.16-rc3\~17\^2/include -g -c si.c -o si-1.o
pts/0, esyr@fedora: /tmp % m68k-linux-gnu-gcc -Ikhdr-v4.16-rc7-194-g29d9d38/include -g -c si.c -o si-2.o
pts/0, esyr@fedora: /tmp % for i in si-orig.o si-1.o si-2.o; do echo -------- $i; objdump -t -j .rodata $i; objdump -s -j .rodata $i; done
-------- si-orig.o

si-orig.o:     file format elf32-big

SYMBOL TABLE:
00000000 l    d  .rodata	00000000 .rodata
00000000 l     O .rodata	00000004 lower_offset



si-orig.o:     file format elf32-big

Contents of section .rodata:
 0000 00000012                             ....            
-------- si-1.o

si-1.o:     file format elf32-big

SYMBOL TABLE:
00000000 l    d  .rodata	00000000 .rodata
00000000 l     O .rodata	00000004 lower_offset



si-1.o:     file format elf32-big

Contents of section .rodata:
 0000 00000012                             ....            
-------- si-2.o

si-2.o:     file format elf32-big

SYMBOL TABLE:
00000000 l    d  .rodata	00000000 .rodata
00000000 l     O .rodata	00000004 lower_offset



si-2.o:     file format elf32-big

Contents of section .rodata:
 0000 00000014                             ....        

So, the offset of the si_lower field is 20 at the current HEAD and was 18 at
commits v4.16-rc3~17^2 and v4.16-rc1~159^2~20.  I believe this is due to
the fact that m68k uses 2-byte default alignment and not 4-byte.

>       signal/x86: Include the field offsets in the build time checks
> 
>  arch/x86/kernel/signal_compat.c    | 65 ++++++++++++++++++++++++++++++++++++++
>  include/linux/compat.h             |  4 +--
>  include/uapi/asm-generic/siginfo.h |  4 +--
>  3 files changed, 69 insertions(+), 4 deletions(-)
> 
