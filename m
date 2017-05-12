From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: Testers with real m68k hardware needed
Date: Fri, 12 May 2017 09:07:25 +0200
Message-ID: <ae08af1c-a34a-7f30-071e-18a181046370@vivier.eu>
References: <e860e027-11ca-e590-59bb-40134fdedd2a@physik.fu-berlin.de>
 <02c664a6-99ff-fb6c-2b82-e6f7c8b0ee83@vivier.eu>
 <13b8a355-fbac-9316-0e5c-ea0a37126d9b@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------9D1B876C6616DCBEA2571498"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:64888 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757134AbdELHHd (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 12 May 2017 03:07:33 -0400
In-Reply-To: <13b8a355-fbac-9316-0e5c-ea0a37126d9b@physik.fu-berlin.de>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

This is a multi-part message in MIME format.
--------------9D1B876C6616DCBEA2571498
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Le 11/05/2017 à 19:01, John Paul Adrian Glaubitz a écrit :
> On 05/11/2017 06:31 PM, Laurent Vivier wrote:
>>> After hours:
>>
>> ...
>>   CC       test_urcu_defer.o
>> /tmp/cczwtyzj.s: Assembler messages:
>> /tmp/cczwtyzj.s:298: Error: syntax error -- statement `add.l
>> %d1,nr_writes@TLSLE+4(%a0)' ignored
>> /tmp/cczwtyzj.s:421: Error: syntax error -- statement `add.l
>> %d1,nr_writes@TLSLE+4(%a0)' ignored
>> make[2]: *** [test_urcu_defer.o] Error 1
>> Makefile:1059: recipe for target 'test_urcu_defer.o' failed
>> make[2]: Leaving directory '/liburcu/userspace-rcu/tests/benchmark'
>> Makefile:367: recipe for target 'all-recursive' failed
>> make[1]: *** [all-recursive] Error 1
>> make[1]: Leaving directory '/liburcu/userspace-rcu/tests'
>> Makefile:474: recipe for target 'all-recursive' failed
>> make: *** [all-recursive] Error 1
> 
> Ah, I forgot to mention that you need to build with --disable-compiler-tls.
> 
> Could you try again? Sorry for the extra effort.
> 
> Adrian
> 

Logs attached.

Laurent

--------------9D1B876C6616DCBEA2571498
Content-Type: text/x-log;
 name="liburcu-build.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="liburcu-build.log"

Making all in include
make[1]: Entering directory '/liburcu/userspace-rcu/include'
make  all-am
make[2]: Entering directory '/liburcu/userspace-rcu/include'
make[2]: Leaving directory '/liburcu/userspace-rcu/include'
make[1]: Leaving directory '/liburcu/userspace-rcu/include'
Making all in src
make[1]: Entering directory '/liburcu/userspace-rcu/src'
  CC       wfqueue.lo
  CC       wfcqueue.lo
  CC       wfstack.lo
  CC       compat_futex.lo
  CCLD     liburcu-common.la
  CC       urcu.lo
  CC       urcu-pointer.lo
  CCLD     liburcu.la
  CC       urcu-qsbr.lo
  CCLD     liburcu-qsbr.la
  CC       liburcu_mb_la-urcu.lo
  CC       liburcu_mb_la-urcu-pointer.lo
  CC       liburcu_mb_la-compat_futex.lo
  CCLD     liburcu-mb.la
  CC       liburcu_signal_la-urcu.lo
  CC       liburcu_signal_la-urcu-pointer.lo
  CC       liburcu_signal_la-compat_futex.lo
  CCLD     liburcu-signal.la
  CC       urcu-bp.lo
  CCLD     liburcu-bp.la
  CC       rculfqueue.lo
  CC       rculfstack.lo
  CC       lfstack.lo
  CC       rculfhash.lo
  CC       rculfhash-mm-order.lo
  CC       rculfhash-mm-chunk.lo
  CC       rculfhash-mm-mmap.lo
  CCLD     liburcu-cds.la
make[1]: Leaving directory '/liburcu/userspace-rcu/src'
Making all in doc
make[1]: Entering directory '/liburcu/userspace-rcu/doc'
Making all in examples
make[2]: Entering directory '/liburcu/userspace-rcu/doc/examples'
Examples: relative top_srcdir path ../..
Examples: relative top_builddir path ../..
make[3]: Entering directory '/liburcu/userspace-rcu/doc/examples'
make -C hlist
make[4]: Entering directory '/liburcu/userspace-rcu/doc/examples/hlist'
make -f Makefile.cds_hlist_add_head_rcu
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/hlist'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/hlist'
make -f Makefile.cds_hlist_del_rcu
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/hlist'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/hlist'
make -f Makefile.cds_hlist_for_each_rcu
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/hlist'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/hlist'
make -f Makefile.cds_hlist_for_each_entry_rcu
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/hlist'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/hlist'
make[4]: Leaving directory '/liburcu/userspace-rcu/doc/examples/hlist'
make -C list
make[4]: Entering directory '/liburcu/userspace-rcu/doc/examples/list'
make -f Makefile.cds_list_add_rcu
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/list'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/list'
make -f Makefile.cds_list_add_tail_rcu
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/list'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/list'
make -f Makefile.cds_list_del_rcu
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/list'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/list'
make -f Makefile.cds_list_for_each_rcu
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/list'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/list'
make -f Makefile.cds_list_for_each_entry_rcu
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/list'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/list'
make -f Makefile.cds_list_replace_rcu
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/list'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/list'
make[4]: Leaving directory '/liburcu/userspace-rcu/doc/examples/list'
make -C urcu-flavors
make[4]: Entering directory '/liburcu/userspace-rcu/doc/examples/urcu-flavors'
make -f Makefile.qsbr
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/urcu-flavors'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/urcu-flavors'
make -f Makefile.mb
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/urcu-flavors'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/urcu-flavors'
make -f Makefile.membarrier
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/urcu-flavors'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/urcu-flavors'
make -f Makefile.signal
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/urcu-flavors'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/urcu-flavors'
make -f Makefile.bp
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/urcu-flavors'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/urcu-flavors'
make[4]: Leaving directory '/liburcu/userspace-rcu/doc/examples/urcu-flavors'
make -C wfcqueue
make[4]: Entering directory '/liburcu/userspace-rcu/doc/examples/wfcqueue'
make -f Makefile.cds_wfcq_enqueue
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/wfcqueue'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/wfcqueue'
make -f Makefile.cds_wfcq_dequeue
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/wfcqueue'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/wfcqueue'
make -f Makefile.cds_wfcq_splice
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/wfcqueue'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/wfcqueue'
make[4]: Leaving directory '/liburcu/userspace-rcu/doc/examples/wfcqueue'
make -C rculfqueue
make[4]: Entering directory '/liburcu/userspace-rcu/doc/examples/rculfqueue'
make -f Makefile.cds_lfq_enqueue
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/rculfqueue'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/rculfqueue'
make -f Makefile.cds_lfq_dequeue
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/rculfqueue'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/rculfqueue'
make[4]: Leaving directory '/liburcu/userspace-rcu/doc/examples/rculfqueue'
make -C wfstack
make[4]: Entering directory '/liburcu/userspace-rcu/doc/examples/wfstack'
make -f Makefile.cds_wfs_push
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/wfstack'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/wfstack'
make -f Makefile.cds_wfs_pop
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/wfstack'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/wfstack'
make -f Makefile.cds_wfs_pop_all_blocking
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/wfstack'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/wfstack'
make[4]: Leaving directory '/liburcu/userspace-rcu/doc/examples/wfstack'
make -C lfstack
make[4]: Entering directory '/liburcu/userspace-rcu/doc/examples/lfstack'
make -f Makefile.cds_lfs_push
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/lfstack'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/lfstack'
make -f Makefile.cds_lfs_pop_blocking
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/lfstack'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/lfstack'
make -f Makefile.cds_lfs_pop_all_blocking
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/lfstack'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/lfstack'
make[4]: Leaving directory '/liburcu/userspace-rcu/doc/examples/lfstack'
make -C rculfhash
make[4]: Entering directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make -f Makefile.cds_lfht_add
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make -f Makefile.cds_lfht_add_unique
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make -f Makefile.cds_lfht_add_replace
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make -f Makefile.cds_lfht_del
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make -f Makefile.cds_lfht_destroy
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make -f Makefile.cds_lfht_lookup
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make -f Makefile.cds_lfht_for_each_entry_duplicate
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make[4]: Leaving directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make[3]: Leaving directory '/liburcu/userspace-rcu/doc/examples'
make[2]: Leaving directory '/liburcu/userspace-rcu/doc/examples'
make[2]: Entering directory '/liburcu/userspace-rcu/doc'
make[2]: Nothing to be done for 'all-am'.
make[2]: Leaving directory '/liburcu/userspace-rcu/doc'
make[1]: Leaving directory '/liburcu/userspace-rcu/doc'
Making all in tests
make[1]: Entering directory '/liburcu/userspace-rcu/tests'
Making all in utils
make[2]: Entering directory '/liburcu/userspace-rcu/tests/utils'
  CC       tap.o
  AR       libtap.a
make[2]: Leaving directory '/liburcu/userspace-rcu/tests/utils'
Making all in common
make[2]: Entering directory '/liburcu/userspace-rcu/tests/common'
  CC       debug-yield.lo
  CCLD     libdebug-yield.la
make[2]: Leaving directory '/liburcu/userspace-rcu/tests/common'
Making all in unit
make[2]: Entering directory '/liburcu/userspace-rcu/tests/unit'
  CC       test_uatomic.o
  CCLD     test_uatomic
  CC       test_urcu_multiflavor.o
  CC       test_urcu_multiflavor-memb.o
  CC       test_urcu_multiflavor-mb.o
  CC       test_urcu_multiflavor-signal.o
  CC       test_urcu_multiflavor-qsbr.o
  CC       test_urcu_multiflavor-bp.o
  CCLD     test_urcu_multiflavor
  CC       test_urcu_multiflavor_dynlink-test_urcu_multiflavor.o
  CC       test_urcu_multiflavor_dynlink-test_urcu_multiflavor-memb.o
  CC       test_urcu_multiflavor_dynlink-test_urcu_multiflavor-mb.o
  CC       test_urcu_multiflavor_dynlink-test_urcu_multiflavor-signal.o
  CC       test_urcu_multiflavor_dynlink-test_urcu_multiflavor-qsbr.o
  CC       test_urcu_multiflavor_dynlink-test_urcu_multiflavor-bp.o
  CCLD     test_urcu_multiflavor_dynlink
make[2]: Leaving directory '/liburcu/userspace-rcu/tests/unit'
Making all in benchmark
make[2]: Entering directory '/liburcu/userspace-rcu/tests/benchmark'
  CC       test_urcu.o
  CCLD     test_urcu
  CC       test_urcu_dynamic_link-test_urcu.o
  CCLD     test_urcu_dynamic_link
  CC       test_urcu_timing.o
  CCLD     test_urcu_timing
  CC       test_urcu_signal-test_urcu.o
  CCLD     test_urcu_signal
  CC       test_urcu_signal_dynamic_link-test_urcu.o
  CCLD     test_urcu_signal_dynamic_link
  CC       test_urcu_signal_timing-test_urcu_timing.o
  CCLD     test_urcu_signal_timing
  CC       test_rwlock_timing.o
  CCLD     test_rwlock_timing
  CC       test_rwlock.o
  CCLD     test_rwlock
  CC       test_perthreadlock_timing.o
  CCLD     test_perthreadlock_timing
  CC       test_perthreadlock.o
  CCLD     test_perthreadlock
  CC       test_urcu_yield-test_urcu.o
  CCLD     test_urcu_yield
  CC       test_urcu_signal_yield-test_urcu.o
  CCLD     test_urcu_signal_yield
  CC       test_urcu_mb-test_urcu.o
  CCLD     test_urcu_mb
  CC       test_urcu_qsbr_timing.o
  CCLD     test_urcu_qsbr_timing
  CC       test_urcu_qsbr.o
  CCLD     test_urcu_qsbr
  CC       test_mutex.o
  CCLD     test_mutex
  CC       test_looplen.o
  CCLD     test_looplen
  CC       test_urcu_gc.o
  CCLD     test_urcu_gc
  CC       test_urcu_signal_gc-test_urcu_gc.o
  CCLD     test_urcu_signal_gc
  CC       test_urcu_lgc-test_urcu_gc.o
  CCLD     test_urcu_lgc
  CC       test_urcu_mb_gc-test_urcu_gc.o
  CCLD     test_urcu_mb_gc
  CC       test_urcu_qsbr_gc.o
  CCLD     test_urcu_qsbr_gc
  CC       test_urcu_qsbr_lgc-test_urcu_qsbr_gc.o
  CCLD     test_urcu_qsbr_lgc
  CC       test_urcu_signal_lgc-test_urcu_gc.o
  CCLD     test_urcu_signal_lgc
  CC       test_urcu_mb_lgc-test_urcu_gc.o
  CCLD     test_urcu_mb_lgc
  CC       test_urcu_qsbr_dynamic_link-test_urcu_qsbr.o
  CCLD     test_urcu_qsbr_dynamic_link
  CC       test_urcu_defer.o
  CCLD     test_urcu_defer
  CC       test_urcu_assign.o
  CCLD     test_urcu_assign
  CC       test_urcu_assign_dynamic_link-test_urcu_assign.o
  CCLD     test_urcu_assign_dynamic_link
  CC       test_urcu_bp.o
  CCLD     test_urcu_bp
  CC       test_urcu_bp_dynamic_link-test_urcu_bp.o
  CCLD     test_urcu_bp_dynamic_link
  CC       test_cycles_per_loop.o
  CCLD     test_cycles_per_loop
  CC       test_urcu_lfq.o
  CCLD     test_urcu_lfq
  CC       test_urcu_wfq.o
  CCLD     test_urcu_wfq
  CC       test_urcu_lfs.o
  CCLD     test_urcu_lfs
  CC       test_urcu_wfs.o
  CCLD     test_urcu_wfs
  CC       test_urcu_lfs_rcu.o
  CCLD     test_urcu_lfs_rcu
  CC       test_urcu_wfcq.o
  CCLD     test_urcu_wfcq
  CC       test_urcu_wfq_dynlink-test_urcu_wfq.o
  CCLD     test_urcu_wfq_dynlink
  CC       test_urcu_wfs_dynlink-test_urcu_wfs.o
  CCLD     test_urcu_wfs_dynlink
  CC       test_urcu_wfcq_dynlink-test_urcu_wfcq.o
  CCLD     test_urcu_wfcq_dynlink
  CC       test_urcu_lfq_dynlink-test_urcu_lfq.o
  CCLD     test_urcu_lfq_dynlink
  CC       test_urcu_lfs_dynlink-test_urcu_lfs.o
  CCLD     test_urcu_lfs_dynlink
  CC       test_urcu_hash-test_urcu_hash.o
  CC       test_urcu_hash-test_urcu_hash_rw.o
  CC       test_urcu_hash-test_urcu_hash_unique.o
  CCLD     test_urcu_hash
  CC       test_urcu_lfs_rcu_dynlink-test_urcu_lfs_rcu.o
  CCLD     test_urcu_lfs_rcu_dynlink
make[2]: Leaving directory '/liburcu/userspace-rcu/tests/benchmark'
Making all in regression
make[2]: Entering directory '/liburcu/userspace-rcu/tests/regression'
  CC       test_urcu_fork.o
  CCLD     test_urcu_fork
  CC       rcutorture_urcu-urcutorture.o
  CCLD     rcutorture_urcu
  CC       rcutorture_urcu_signal-urcutorture.o
  CCLD     rcutorture_urcu_signal
  CC       rcutorture_urcu_mb-urcutorture.o
  CCLD     rcutorture_urcu_mb
  CC       rcutorture_urcu_bp-urcutorture.o
  CCLD     rcutorture_urcu_bp
  CC       rcutorture_urcu_qsbr-urcutorture.o
  CCLD     rcutorture_urcu_qsbr
make[2]: Leaving directory '/liburcu/userspace-rcu/tests/regression'
make[2]: Entering directory '/liburcu/userspace-rcu/tests'
make[2]: Nothing to be done for 'all-am'.
make[2]: Leaving directory '/liburcu/userspace-rcu/tests'
make[1]: Leaving directory '/liburcu/userspace-rcu/tests'
make[1]: Entering directory '/liburcu/userspace-rcu'
make[1]: Nothing to be done for 'all-am'.
make[1]: Leaving directory '/liburcu/userspace-rcu'

--------------9D1B876C6616DCBEA2571498
Content-Type: text/x-log;
 name="liburcu-check.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="liburcu-check.log"

Making check in include
make[1]: Entering directory '/liburcu/userspace-rcu/include'
make[1]: Leaving directory '/liburcu/userspace-rcu/include'
Making check in src
make[1]: Entering directory '/liburcu/userspace-rcu/src'
make[1]: Nothing to be done for 'check'.
make[1]: Leaving directory '/liburcu/userspace-rcu/src'
Making check in doc
make[1]: Entering directory '/liburcu/userspace-rcu/doc'
Making check in examples
make[2]: Entering directory '/liburcu/userspace-rcu/doc/examples'
Examples: relative top_srcdir path ../..
Examples: relative top_builddir path ../..
make[3]: Entering directory '/liburcu/userspace-rcu/doc/examples'
make -C hlist
make[4]: Entering directory '/liburcu/userspace-rcu/doc/examples/hlist'
make -f Makefile.cds_hlist_add_head_rcu
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/hlist'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/hlist'
make -f Makefile.cds_hlist_del_rcu
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/hlist'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/hlist'
make -f Makefile.cds_hlist_for_each_rcu
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/hlist'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/hlist'
make -f Makefile.cds_hlist_for_each_entry_rcu
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/hlist'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/hlist'
make[4]: Leaving directory '/liburcu/userspace-rcu/doc/examples/hlist'
make -C list
make[4]: Entering directory '/liburcu/userspace-rcu/doc/examples/list'
make -f Makefile.cds_list_add_rcu
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/list'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/list'
make -f Makefile.cds_list_add_tail_rcu
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/list'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/list'
make -f Makefile.cds_list_del_rcu
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/list'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/list'
make -f Makefile.cds_list_for_each_rcu
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/list'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/list'
make -f Makefile.cds_list_for_each_entry_rcu
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/list'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/list'
make -f Makefile.cds_list_replace_rcu
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/list'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/list'
make[4]: Leaving directory '/liburcu/userspace-rcu/doc/examples/list'
make -C urcu-flavors
make[4]: Entering directory '/liburcu/userspace-rcu/doc/examples/urcu-flavors'
make -f Makefile.qsbr
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/urcu-flavors'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/urcu-flavors'
make -f Makefile.mb
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/urcu-flavors'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/urcu-flavors'
make -f Makefile.membarrier
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/urcu-flavors'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/urcu-flavors'
make -f Makefile.signal
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/urcu-flavors'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/urcu-flavors'
make -f Makefile.bp
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/urcu-flavors'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/urcu-flavors'
make[4]: Leaving directory '/liburcu/userspace-rcu/doc/examples/urcu-flavors'
make -C wfcqueue
make[4]: Entering directory '/liburcu/userspace-rcu/doc/examples/wfcqueue'
make -f Makefile.cds_wfcq_enqueue
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/wfcqueue'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/wfcqueue'
make -f Makefile.cds_wfcq_dequeue
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/wfcqueue'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/wfcqueue'
make -f Makefile.cds_wfcq_splice
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/wfcqueue'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/wfcqueue'
make[4]: Leaving directory '/liburcu/userspace-rcu/doc/examples/wfcqueue'
make -C rculfqueue
make[4]: Entering directory '/liburcu/userspace-rcu/doc/examples/rculfqueue'
make -f Makefile.cds_lfq_enqueue
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/rculfqueue'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/rculfqueue'
make -f Makefile.cds_lfq_dequeue
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/rculfqueue'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/rculfqueue'
make[4]: Leaving directory '/liburcu/userspace-rcu/doc/examples/rculfqueue'
make -C wfstack
make[4]: Entering directory '/liburcu/userspace-rcu/doc/examples/wfstack'
make -f Makefile.cds_wfs_push
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/wfstack'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/wfstack'
make -f Makefile.cds_wfs_pop
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/wfstack'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/wfstack'
make -f Makefile.cds_wfs_pop_all_blocking
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/wfstack'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/wfstack'
make[4]: Leaving directory '/liburcu/userspace-rcu/doc/examples/wfstack'
make -C lfstack
make[4]: Entering directory '/liburcu/userspace-rcu/doc/examples/lfstack'
make -f Makefile.cds_lfs_push
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/lfstack'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/lfstack'
make -f Makefile.cds_lfs_pop_blocking
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/lfstack'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/lfstack'
make -f Makefile.cds_lfs_pop_all_blocking
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/lfstack'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/lfstack'
make[4]: Leaving directory '/liburcu/userspace-rcu/doc/examples/lfstack'
make -C rculfhash
make[4]: Entering directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make -f Makefile.cds_lfht_add
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make -f Makefile.cds_lfht_add_unique
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make -f Makefile.cds_lfht_add_replace
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make -f Makefile.cds_lfht_del
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make -f Makefile.cds_lfht_destroy
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make -f Makefile.cds_lfht_lookup
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make -f Makefile.cds_lfht_for_each_entry_duplicate
make[5]: Entering directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make[5]: Nothing to be done for 'all'.
make[5]: Leaving directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make[4]: Leaving directory '/liburcu/userspace-rcu/doc/examples/rculfhash'
make[3]: Leaving directory '/liburcu/userspace-rcu/doc/examples'
make[2]: Leaving directory '/liburcu/userspace-rcu/doc/examples'
make[2]: Entering directory '/liburcu/userspace-rcu/doc'
make[2]: Nothing to be done for 'check-am'.
make[2]: Leaving directory '/liburcu/userspace-rcu/doc'
make[1]: Leaving directory '/liburcu/userspace-rcu/doc'
Making check in tests
make[1]: Entering directory '/liburcu/userspace-rcu/tests'
Making check in utils
make[2]: Entering directory '/liburcu/userspace-rcu/tests/utils'
make[2]: Leaving directory '/liburcu/userspace-rcu/tests/utils'
Making check in common
make[2]: Entering directory '/liburcu/userspace-rcu/tests/common'
make[2]: Nothing to be done for 'check'.
make[2]: Leaving directory '/liburcu/userspace-rcu/tests/common'
Making check in unit
make[2]: Entering directory '/liburcu/userspace-rcu/tests/unit'
./run.sh unit_tests
./test_uatomic ................... ok
./test_urcu_multiflavor .......... ok
./test_urcu_multiflavor_dynlink .. ok
All tests successful.
Files=3, Tests=78, 16 wallclock secs ( 6.03 usr  1.13 sys +  2.08 cusr  2.85 csys = 12.09 CPU)
Result: PASS
make[2]: Leaving directory '/liburcu/userspace-rcu/tests/unit'
Making check in benchmark
make[2]: Entering directory '/liburcu/userspace-rcu/tests/benchmark'
make[2]: Leaving directory '/liburcu/userspace-rcu/tests/benchmark'
Making check in regression
make[2]: Entering directory '/liburcu/userspace-rcu/tests/regression'
make[2]: Leaving directory '/liburcu/userspace-rcu/tests/regression'
make[2]: Entering directory '/liburcu/userspace-rcu/tests'
make[2]: Nothing to be done for 'check-am'.
make[2]: Leaving directory '/liburcu/userspace-rcu/tests'
make[1]: Leaving directory '/liburcu/userspace-rcu/tests'
make[1]: Entering directory '/liburcu/userspace-rcu'
make[1]: Nothing to be done for 'check-am'.
make[1]: Leaving directory '/liburcu/userspace-rcu'

--------------9D1B876C6616DCBEA2571498--
