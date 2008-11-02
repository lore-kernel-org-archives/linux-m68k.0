From: "Jan Dittmer" <jdi@l4x.org>
Subject: m68k, gcc 4.2.4 internal compiler error: in find_reloads_address_1
Date: Sun, 2 Nov 2008 19:53:06 +0100
Message-ID: <621d098f0811021053t125f7231na46af9a59767927e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org

Hi,

somewhere between 2.6.27-git8 (0cfd81031a26717fe14380d18275f8e217571615)
and 2.6.27-git9 (a50c22eed593f474e75f693381e4d42e81762de8) my cross-compile
toolchain broke. Using gcc 4.2.4, ld 2.17.50.0.17.20070615 configured for m68k,
and building amiga_defconfig yields

  CC      fs/proc/stat.o
/fs/proc/stat.c: In function 'show_stat':
/fs/proc/stat.c:115: internal compiler error: in
find_reloads_address_1, at reload.c:5639
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://gcc.gnu.org/bugs.html> for instructions.
make[3]: *** [fs/proc/stat.o] Error 1
make[2]: *** [fs/proc] Error 2
make[1]: *** [fs] Error 2
make: *** [sub-make] Error 2

(Full log at http://l4x.org/k/?d=52637)

is this problem known or worth the hassle to report to gcc bugzilla?
Also, with which
version are you guys currently compiling?

Thanks,

Jan


-- 
Jan Dittmer <jdi@l4x.org>
