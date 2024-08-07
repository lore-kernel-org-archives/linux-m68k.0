Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D7718D63A
	for <linux-m68k@vger.kernel.org>; Wed,  7 Aug 2024 08:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723018482; cv=none; b=fzkmTnaKFSt1RdQXGwlZqkOqDDYhs5MpJcTMOGqimxKUffP6vxEMvLY92j23OmspX8F5w0qbn0xiRvU4h1XddkA2r+aUs2rBXZIwN7/qVgirGv6fHQ3XI57RgJoc73GhwvCFsyU8G9THamWAfVBZ7YbzZbjQJ98xGGRSSQm3ChM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723018482; c=relaxed/simple;
	bh=Vai7uZkEr41C/0KxHk9Bs8idVBRycnEEYHSsR2Yua3A=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qIyAkjmITNiEDyo4XHJxPWae234WSmyhM5EUOONmMlI+0syIHVCAJC8AL6tCxQEjuvy6xDG1ZlaYXCyKzV6p2mFioaq8HICvpmMQHhFCX26FmzdSy0wBDhT9AIVWpyFQdSgT+gfx9t+kHzfowEH+BJihJSlOWiHsYgfGHX4edKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uSqBhXhh; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uSqBhXhh"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 501201151A8E;
	Wed,  7 Aug 2024 04:14:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 07 Aug 2024 04:14:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1723018478; x=1723104878; bh=AWkO6ncwbf4h8b9xwaNfxL2Qx1Ll
	3lrZf8UdKYVaFe4=; b=uSqBhXhhSNM203QHN+vd/IRpQWXSXyFFyw5aYdGnaDLz
	2HvaR7+j/YRf1Tu5KRshQleH6puNltrZL6i5IVLxnYRwSe/wZpsIxExPWzsE1Ssx
	fhuzWSFG4Oaz9Fp1LFE3dsXWQC7MZG6/x+mySW4xs8TnqjVUyW7jQJ9UGo3iaol2
	2AsBEkEmkOgeBlurKHc7Ug/px6OTVsTTv68SyXlabjVlxw2vhW5s0OcGDf3l6GI5
	4YN7zhHNhe/wUeSmGFGbYin+sT2mHqhVtxaFxNdbhTxsmZjfWBd4X2lxzFrSB7q7
	V2Q7WMAluQ6/Rzi5yOD69fWX4KVqyQuvDKZFTOPKYA==
X-ME-Sender: <xms:7SyzZhlu8XpJmUiTmyZVn4Tfj-gNQ5O-f3Rsqe_1OdfV6nDAopYlKA>
    <xme:7SyzZs1yuLZ7dEib_rUCBuBoAx6i2flIMTi2FwEaepjLdjoCUG_E0oSZ3u-iUZmt5
    YjTM4FMfE-n5lIhcAY>
X-ME-Received: <xmr:7SyzZnpnCRZYmd_-_0O3QRoi_w7YedAuPDqDzBlAsAFoL9r2UjJZsiaKl7lYz7KWeFRAMulHjyzlQCNwsQsDEzB7NYSaCV6rDvU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrledtgddtvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepheffleefteekleeuueduueejhffhteetledthefhteekgfetudejgfeuffei
    teegnecuffhomhgrihhnpehstghsihdqthgvshhtrdhshhenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmhei
    kehkrdhorhhgpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:7SyzZhkXVEpRUMjf3kPdCoiM1R5VM7tIke5Pmx6SCqOFbChOsf8H1Q>
    <xmx:7SyzZv0P3mfnsJ1ZaQepATAI1xm8aZMcisEAHAnD743OhLVrBxHkmA>
    <xmx:7SyzZgu5DGB2jf62h7k3Do9Tzlta_5P3kuILyvytRM5Ftqt-LoNuoA>
    <xmx:7SyzZjU9bObceKv23dZvjbEPqubJhkJfD31o2ABZd6V71QeVBtS0sw>
    <xmx:7iyzZqRdkgZwrm7glyDTZrsXnavKM0ZKMMWEpVjA0Tiv9eWEeP26ndpY>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Aug 2024 04:14:35 -0400 (EDT)
Date: Wed, 7 Aug 2024 18:14:34 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: linux-m68k@vger.kernel.org, geert@linux-m68k.org, gerg@linux-m68k.org, 
    linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH v4 1/2] m68k: Handle __generic_copy_to_user faults more
 carefully
In-Reply-To: <20240429030945.22451-2-schmitzmic@gmail.com>
Message-ID: <e0d53477-1646-9504-2382-f8793d078704@linux-m68k.org>
References: <20240429030945.22451-1-schmitzmic@gmail.com> <20240429030945.22451-2-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Mon, 29 Apr 2024, Michael Schmitz wrote:

> As mentioned by Finn Thain in his patch to improve put_user
> exception handling on 040, a similar problem exists on 030
> processors.
> 
> A moves instruction that crosses a page boundary from a
> mapped page into an unmapped one will cause a mid-instruction
> bus error exception (frame format b), with the PC pointing
> (usually) two instructions past the faulting movesl instruction.
> 
> Our exception handling in __generic_copy_to_user only covers
> the instruction immediately following the faulting one. As
> a result, fixup_exception in send_fault_sig does not detect
> this case, and cause send_fault_sig to oops.
> 
> Extend the exception table to cover one additional instruction
> beyond the moves[lwb] instructions.
> 
> Tested on 68030 (Atari Falcon 030) with transfers beginning
> at one to six bytes offset from the end of a mapped page,
> followed by further bytes on an unmapped page (testcase
> derived from stress-ng sysbadaddr stressor by Finn Thain).
> 
> Tested on 68040 (Mac Quadra) and 68030 (Mac IIci) by Finn Thain.
> 
> A similar problem is present in __clear_user(); modify the
> exception table for that function in the same way (tested by
> Finn Thain).
> 

Well, that __clear_user() bug is no longer theoretical. I accidentally 
bumped into it when I sent a ^C to a shell script I wrote to test some 
mac_scsi driver patches...


[    0.000000] Linux version 6.10.0-mac-00011-gd1d490afeb2a (fthain@nippy) (m68k-unknown-linux-musl-gcc (Gentoo 13.2.1_p20240210 p14) 13.2.1 20240210, GNU ld (Gentoo 2.40 p7) 2.40.0) #39 Sat Aug  3 19:57:43 AEST 2024

...

root@(none):/# bash scsi-test.sh /dev/sda5
bs=512k count=1
[  130.090000] sd 0:0:0:0: [sda] tag#9 PDMA fixup: DRQ timeout
[  130.090000] sd 0:0:0:0: [sda] tag#9 switching to slow handshake
[  130.180000] sd 0:0:0:0: Power-on or device reset occurred
1+0 records in
1+0 records out
524288 bytes (524 kB, 512 KiB) copied, 5.13732 s, 102 kB/s
[  136.030000] bash (57): drop_caches: 3
^C
root@(none):/# bash scsi-test.sh /dev/sdb5
bs=512k count=1
1+0 records in
1+0 records out
524288 bytes (524 kB, 512 KiB) copied, 1.1273 s, 465 kB/s
[  160.440000] bash (61): drop_caches: 3
1+0 records in
1+0 records out
524288 bytes (524 kB, 512 KiB) copied, 1.12763 s, 465 kB/s
[  171.920000] bash (61): drop_caches: 3

bs=64k count=8
8+0 records in
8+0 records out
524288 bytes (524 kB, 512 KiB) copied, 1.03469 s, 507 kB/s
[  184.480000] bash (61): drop_caches: 3
8+0 records in
8+0 records out
524288 bytes (524 kB, 512 KiB) copied, 1.03221 s, 508 kB/s
[  196.340000] bash (61): drop_caches: 3

bs=4k count=128
128+0 records in
128+0 records out
524288 bytes (524 kB, 512 KiB) copied, 1.13089 s, 464 kB/s
[  208.860000] bash (61): drop_caches: 3
128+0 records in
128+0 records out
524288 bytes (524 kB, 512 KiB) copied, 1.13089 s, 464 kB/s
[  220.850000] bash (61): drop_caches: 3

bs=512 count=1k
1024+0 records in
1024+0 records out
524288 bytes (524 kB, 512 KiB) copied, 3.69678 s, 142 kB/s
[  236.020000] bash (61): drop_caches: 3
1024+0 records in
1024+0 records out
524288 bytes (524 kB, 512 KiB) copied, 3.68874 s, 142 kB/s
[  250.570000] bash (61): drop_caches: 3

bs=512k count=1
1+0 records in
1+0 records out
524288 bytes (524 kB, 512 KiB) copied, 1.12338 s, 467 kB/s
[  263.120000] bash (61): drop_caches: 3
1+0 records in
1+0 records out
524288 bytes (524 kB, 512 KiB) copied, 1.12665 s, 465 kB/s
[  275.110000] bash (61): drop_caches: 3

bs=64k count=8
8+0 records in
8+0 records out
524288 bytes (524 kB, 512 KiB) copied, 1.08861 s, 482 kB/s
[  287.610000] bash (61): drop_caches: 3
8+0 records in
8+0 records out
524288 bytes (524 kB, 512 KiB) copied, 1.03319 s, 507 kB/s
[  299.510000] bash (61): drop_caches: 3
^C[  303.190000] Unable to handle kernel access at virtual address d7d17fd7
[  303.200000] Oops: 00000000
[  303.210000] Modules linked in:
[  303.220000] PC: [<004301fe>] __clear_user+0x22/0x40
[  303.240000] SR: 2000  SP: 4841d159  a2: 00b78590
[  303.250000] d0: 000003ab    d1: 00000000    d2: 00000000    d3: 8000c150
[  303.260000] d4: 00002000    d5: 00000000    a0: 8000c154    a1: 009bdb3c
[  303.280000] Process cmp (pid: 92, task=7d95deea)
[  303.290000] Frame format=B ssw=0709 isc=0801 isb=0001 daddr=8000c150 dobuf=00000000
[  303.310000] baddr=00430202 dibuf=8000c150 ver=f
[  303.320000] Stack from 0149de8c:
[  303.320000]         8001c2c4 0149deb8 00139904 8000c150 00000eb0 00983c00 00000000 00000003
[  303.320000]         00000003 8000bf00 00983a00 0149df40 0013a1fa 00912480 8000bf00 00983c60
[  303.320000]         00000003 00000012 00000000 fffffff8 00000006 d012f728 00000000 00983a5a
[  303.320000]         00000004 00983a00 000579d4 0052b7e8 009125a0 00912480 00983a5a 80000034
[  303.320000]         000d1704 014994c0 80008864 80000000 00000000 80008864 80008864 00000000
[  303.320000]         01497800 00000000 00000034 fffffff8 fffffff8 0149df7c 000e9296 00983a00
[  303.380000] Call Trace: [<00139904>] elf_load+0x192/0x1da
[  303.390000]  [<0013a1fa>] load_elf_binary+0x8ae/0xe46
[  303.400000]  [<000579d4>] try_module_get+0x0/0x48
[  303.410000]  [<000d1704>] kfree+0x0/0x160
[  303.420000]  [<000e9296>] bprm_execve+0x134/0x416
[  303.430000]  [<000e9daa>] copy_string_kernel+0x0/0x184
[  303.440000]  [<000e9fa4>] copy_strings+0x0/0x310
[  303.460000]  [<000ea3f6>] do_execveat_common+0x142/0x1d2
[  303.480000]  [<000eb128>] sys_execve+0x2a/0x36
[  303.490000]  [<0000275e>] syscall+0x8/0xc
[  303.510000]  [<0008c010>] do_read_cache_folio+0xde/0x2c8
[  303.520000] 
[  303.520000] Code: 206e 0008 4282 4a80 6708 0e98 2800 5380 <66f8> 0801 0001 6704 0e58 2800 0801 0000 6704 0e10 2800 241f 4e5e 4e75 4e75 4e56
[  303.560000] Disabling lock debugging due to kernel taint

root@(none):/# 


Also, it appears that the patch Michael posted in this thread would have 
prevented that oops because the "jne 1b" at __clear_user+0x22 would have 
been found in the exception table.
