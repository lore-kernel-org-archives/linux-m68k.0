From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: Testers with real m68k hardware needed
Date: Thu, 11 May 2017 18:31:36 +0200
Message-ID: <02c664a6-99ff-fb6c-2b82-e6f7c8b0ee83@vivier.eu>
References: <e860e027-11ca-e590-59bb-40134fdedd2a@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-Reply-To: <e860e027-11ca-e590-59bb-40134fdedd2a@physik.fu-berlin.de>
Content-Language: en-US
Resent-Message-ID: <ZYEgFoNmWmB.A.mo.7HJFZB@bendel>
List-URL: <https://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/02c664a6-99ff-fb6c-2b82-e6f7c8b0ee83@vivier.eu
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Le 10/05/2017 à 23:08, John Paul Adrian Glaubitz a écrit :
> Hi!
> 
> liburcu is currently missing support m68k. The maintainer of the Debian package
> has kindly written a patch which adds m68k support to the library [1]. However,
> he was told by upstream that the patch should be tested on real hardware.
> 
> So, for anyone currently running Debian/m68k, your help is needed. I do have
> various m68k machines with Debian myself, but they are currently offline but
> I am planning on bringing them back online in some months.
> 
> Thus, in the meantime it would be great if someone else with real hardware
> readily available could help.
> 
> To test, do the following:
> 
> # apt update
> # apt install git
> # apt build-dep liburcu
> # mkdir liburcu
> # cd liburcu
> # git clone https://github.com/mjeanson/userspace-rcu.git
> # cd userspace-rcu/
> # git checkout m68k
> # ./bootstrap
> # ./configure
> # make | liburcu-build.log
> # make check | tee  liburcu-check.log
> 
> Then please post both liburcu-build.log and liburcu-check.log to the list.
> 
> Thanks,
> Adrian
> 
>> [1] https://github.com/mjeanson/userspace-rcu/commit/b4aa8c191528081d28b1538f0156b91f6cdd1f25
> After hours:

...
  CC       test_urcu_defer.o
/tmp/cczwtyzj.s: Assembler messages:
/tmp/cczwtyzj.s:298: Error: syntax error -- statement `add.l
%d1,nr_writes@TLSLE+4(%a0)' ignored
/tmp/cczwtyzj.s:421: Error: syntax error -- statement `add.l
%d1,nr_writes@TLSLE+4(%a0)' ignored
make[2]: *** [test_urcu_defer.o] Error 1
Makefile:1059: recipe for target 'test_urcu_defer.o' failed
make[2]: Leaving directory '/liburcu/userspace-rcu/tests/benchmark'
Makefile:367: recipe for target 'all-recursive' failed
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory '/liburcu/userspace-rcu/tests'
Makefile:474: recipe for target 'all-recursive' failed
make: *** [all-recursive] Error 1

Laurent
