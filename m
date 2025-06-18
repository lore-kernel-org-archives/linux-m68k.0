Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E1E2EF9BF
	for <linux-m68k@lists.linux-m68k.org>; Wed, 18 Jun 2025 15:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750261463; cv=pass; b=IzfLF6d/bLQ3a4iFYnFPr95VMXb6w4HmBXxPo/79ztgtIeEFeNRMyFWx4hBS4OOSxhFA/IYG4p5GFTomwl8LMLT9GsxrbHteDPNLuNhjrrh5Rc0j738NdjmWDJJ5cFhR2D454AEy68AHAg0wcZbZsxLtajBScY5bPdN3YKbkr5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750261463; c=relaxed/simple;
	bh=0PChpZZcxBTee4ekPwAdtSiUTVZYfyzAxN+Tiey2ywo=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ZkmpkAebGrfqAMjjd5GAnvQj0LqRCsbGl9twN3G80HBYgolWiGj/Q9P4UXTc0c/WjPkmVmQKBTnBkCqpmmXcgUeqWvFddw6OS4/zdjkJHti/cg5vwB1oYugCRYzdtlInbkhLwF4c4IlGfJ8iU2iB+c041V3KIVhGRGg9sEwvCag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fpond.eu; spf=none smtp.mailfrom=fpond.eu; dkim=pass (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b=VGgJkb7+; dkim=permerror (0-bit key) header.d=fpond.eu header.i=@fpond.eu header.b=7EWfcwyP; arc=pass smtp.client-ip=85.215.255.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fpond.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fpond.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="VGgJkb7+";
	dkim=permerror (0-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="7EWfcwyP"
ARC-Seal: i=1; a=rsa-sha256; t=1750261453; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=UUlEhnzO/4BPW5FSbitC8s1fff1o4KrdRdJQodetGGbrbz1oJINMbYAWgy/K+K/yVF
    uvefO4rxrkJU3l0nbLTMbQMQqI8hN1MjqgU4Yjn1g2mHQPIEhUBiiI9UejrSwmmC0sFM
    QW1+gGKYjCcFo0MauG+GCnLPDSHUlVXRhmKFw79EX4fSxsrs9SP8tAt4Y8tDCe73VFo5
    CWQQ/qyBl/jpsh78eWAAl3zaruiGln/g4d6ETxldFHdO+HDV4iSMM3XBnpb1b3IMeRGJ
    5QAZ9tIXzD7nm6QiM7t9PyMtTEPW2xmfthKGyJBemjWDgWZimwpoxeSC7sYtDBlxgezT
    KDhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1750261453;
    s=strato-dkim-0002; d=strato.com;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=iM3r5D46BIauaLI/sTimycMV3v+5FS8I6Sj5/MW8eSU=;
    b=WiwaIpU4ueCyrnsefZwLc5YMfE/l1V+2vgDf3oumit1GJ/XwDFCgzYCQ7/pbuAd6lT
    lvJMc7+eYl5imjeO8u0m0+x09gkQ/WxcKsf3C3Voti4S3KGQEq5DS0RxhKslegE7Z2ec
    qssmhLhr9V1rRGVKk8xjzCjP4khUTIyvvMWHPRqNz5hi1X5ONEkW/QtmwrdiQfURE0Ja
    XQ0DHktDob2pmkGXhv1na628criVUBUxG9vDHPuc/Hxu81/OodeqLBM6Agg4VZjFgr8P
    t6r3Iv8usQKtrxChAEufJG8qH56ioyGOF/hppbIi/hyRK2sJfyl9ROkV2kfERZWTZsYA
    HK4Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1750261453;
    s=strato-dkim-0002; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=iM3r5D46BIauaLI/sTimycMV3v+5FS8I6Sj5/MW8eSU=;
    b=VGgJkb7+772a27IkDVti32K5WKAqSBZSCKfOb3ruOYZm1WNbyMr1p3srdrAeGGzhKD
    fZ7PXRElwKBryT6NEtr3MOnV1f1PBgJvv8E0BC3Xez+jpYcNesofPWst16MTQPJPRiMr
    BbrjEf3Ttc/23H5Y9Rc2Ma7BVHFM735Fj+3+ENKdFmhW0uJybvGPavtAXU+qhO+dbnFC
    0D2GEXgBkK8+jGgMh9wTQzHwULRdMNvWtI8sEml5pGJfNipmB8fRJRRugijCaqJRt7PV
    yembg0CWXX3fph0H7nPK12xUAWvr/5SjFCmzDx8s5px7oGL4V/ZWCmyC2MH4Q/AN54Dm
    O3pA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1750261453;
    s=strato-dkim-0003; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=iM3r5D46BIauaLI/sTimycMV3v+5FS8I6Sj5/MW8eSU=;
    b=7EWfcwyPVK6jjAGftgMEWBA3kXuBKGgKATIa+ICm90kLb9WS1qpY9+RbPoIYx37ysm
    3F2SG4DilkfBSAR8PgDw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv30UF1hex6fd76vq"
Received: from open-xchange-core-mw-gw-27.open-xchange-core-mw-hazelcast-headless.open-xchange.svc.cluster.local
    by smtp-ox.front (RZmta 51.3.0 AUTH)
    with ESMTPSA id z2a34015IFiDUuf
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 18 Jun 2025 17:44:13 +0200 (CEST)
Date: Wed, 18 Jun 2025 17:44:12 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: Finn Thain <fthain@linux-m68k.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
	Pavel Machek <pavel@denx.de>, Michael Schmitz <schmitzmic@gmail.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	cip-dev@lists.cip-project.org, linux-m68k@lists.linux-m68k.org
Message-ID: <279974101.333016.1750261452981@webmail.strato.de>
In-Reply-To: <288cd2e42b6d4cbf77822cce3b348d6f@linux-m68k.org>
References: <288cd2e42b6d4cbf77822cce3b348d6f@linux-m68k.org>
Subject: Re: [cip-dev] [PATCH RESEND 4.19.y-cip] signal/m68k: Use
 force_sigsegv(SIGSEGV) in fpsp040_die
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v8.36.53
X-Originating-Port: 46284
X-Originating-Client: open-xchange-appsuite


> On 05/16/2025 11:28 AM CEST Finn Thain <fthain@linux-m68k.org> wrote:
> 
>  
> From: "Eric W. Biederman" <ebiederm@xmission.com>
> 
> [ Upstream commit a3616a3c02722d1edb95acc7fceade242f6553ba ]
> 
> In the fpsp040 code when copyin or copyout fails call
> force_sigsegv(SIGSEGV) instead of do_exit(SIGSEGV).
> 
> This solves a couple of problems.  Because do_exit embeds the ptrace
> stop PTRACE_EVENT_EXIT a complete stack frame needs to be present for
> that to work correctly.  There is always the information needed for a
> ptrace stop where get_signal is called.  So exiting with a signal
> solves the ptrace issue.
> 
> Further exiting with a signal ensures that all of the threads in a
> process are killed not just the thread that malfunctioned.  Which
> avoids confusing userspace.
> 
> To make force_sigsegv(SIGSEGV) work in fpsp040_die modify the code to
> save all of the registers and jump to ret_from_exception (which
> ultimately calls get_signal) after fpsp040_die returns.
> 
> v2: Updated the branches to use gas's pseudo ops that automatically
>     calculate the best branch instruction to use for the purpose.
> 
> v1: https://lkml.kernel.org/r/87a6m8kgtx.fsf_-_@disp2133
> Link: https://lkml.kernel.org/r/87tukghjfs.fsf_-_@disp2133
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
> [ Pass 'current' to force_sigsegv() as was done prior to v5.3 ]
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Thanks, applied for the next 4.19.
Please CC me for 4.4 and 4.19 patches in the future.

CU
Uli
