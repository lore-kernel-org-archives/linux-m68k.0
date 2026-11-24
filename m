Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503980;
	b=PaiXH8OMd9lkhIGWRqPTIYLILYHU8UVSUeXYepDMRrklwOjORYZx/XzGebcLCM4Rg84O
	 7fG9EkFZBBGbxrJdRSJxn7mm00EqAsD2hxsrAUUZE9q0io4xBGxQq7S8zuCvJv016RQFK
	 mGyB5/1E1z84jB2rYglnzl3PjGUmUTjGvtwNVNkb6IbcQFNaFTYucmLAphiKiJ9LEj6Ce
	 Gb5V6qgYXHgnTYDB1i2or/udR9tMbZqkLWiluelJBeIcmiEnNolm8bSpE92fn8qxyT4MG
	 eefP+YKcrLSeiZ9E5eV1FFHU3cC08Qt0hZU1w8DDLHMntk3+0M+aQ05BOBD/Z9u+vDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503980;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=KmR1RbXJR05JNPFUQlo6yTLa2DCqanf5ivh5dNvv0Hc=;
	b=jtdhlWLT5l3OFIFT/SUnLKki7PBRpwpVzjFvW0+fnVLYig8mMqNunPFBMRyAG7v0XNZX
	 i1GU9ZTwOqFdzCnA0sSZoJ7uTh3mGyheq1kMtylEFZDYKigLc+Au3sn9tP7k7XCI8X08y
	 XW210wJUhjEJpqqVFwkYVmeJqev+3jsIGyshRObddbPuoDnAuntwe7dhmnS1e/BXOizp4
	 jIivirpqk4soMK+d+1Xj3qJnBW33vu78ZUCPWenPWmExOG9gjNhrHqYG0jsJpl00bSBAL
	 t2M1tZT3/Hqy+i0VCtnmgc1rBa/z7qHdLx3g//3oMkdYFQUDya0rKpjH++7VzQ8aYfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=SseP3DPj;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FUAvDOLr;
	arc=none smtp.remote-ip=202.12.124.149
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4403606A31E
	for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Nov 2026 07:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4403606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=SseP3DPj;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FUAvDOLr
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 023871D004C9
	for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Nov 2026 02:06:18 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 24 Nov 2026 02:06:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795503976;
	 x=1795590376; bh=KmR1RbXJR05JNPFUQlo6yTLa2DCqanf5ivh5dNvv0Hc=; b=
	SseP3DPjSUhi9CUAGkTkemrgD7lOE7gBemc9UkjFMhRvq+q14jFaBcfqS5Vazf2J
	ckyjqMnCOKmbaW2vVANiEhS63UWYVF75O+EuJLTNyaVdrlsla2/V7nG/qV37NY6v
	pv09DrqaY4aZbxiuqII1p8nLNsRHtIkezP7gPUqZJCfGyiJppClUBwaIKnBQ8yAr
	FCVGExW0kIFrGwiUkdkwTFH/XtuR/yqvsDkifG+yxWwTPQvE7mm07IlWqUSxeBVn
	hDX+A1QbTsoQfNxNgnh1lSwVzfr94VP5J0+M9cd69ynHsfEEQ1cEz5qCxcrJzaq4
	tv9TydKyviXr0qv5vQ3Y5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795503976; x=
	1795590376; bh=KmR1RbXJR05JNPFUQlo6yTLa2DCqanf5ivh5dNvv0Hc=; b=F
	UAvDOLr2/MxOXDyBUopqidgJQetjt4AqYM/7Yb7gBKZ48MHZynOzMitdyHNF9nEk
	RjYDZzfwnYq2HDrapa4+1D/KtMmWKsGBeivwrxgvDaB9fzgoof7Tyh+xXdhY5YTK
	bmrbdRVogBhW6QIy1dw73DlNMvcaHUWUVtg6S7Xjdn/8JASldYeRFftMfreSYlWu
	OIv155YHcuTrBiwPwTWWLMoYSqtXc6ad5slkjX0iodl211t+bt1O+7WVaQku4WXf
	m20/uxmdJ3AE1p0asO/VBCbUyuoP7pi1jfybx7Pni5AgYz+kTZ7uHdHHR9ZR41O2
	b2yN8jK6xCwr9DUiO3AJg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795503976; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LW02OGtAbGlzdHMubGludXgtbTY4ay5vcmc+;
	s=fm2:rsa-sha256:NA9T9J+HZ2yLjyZkNxXrpaYgbKFc+v2wmiqQ/W2W/IZ1xlb
	0t9tZEzBLaUNCnznOBCF0BRNJIxjmaWYTNRf05cBrZzWDpByAH15FZ0Rzkq0wqos
	Mn0FvieoTtqClxZ/AdVk7Y3CuMRFIbHj3n2ZUVmmvPmM3HG/EATTpYdjPBE7U2zZ
	44+cuH3xjYztutOucG6zhsyXnAAf3QpnWcanTRsv0h6LuFhW57ADN/7MKQIRCnuE
	/UTmHWnpGBTzAKBCPZLnqiB2p75ctMQUbEK3OVyo0H/s6lvnCspuM3Rul1MwTuw+
	Ms2uxgjjiZ45srlhzFbbqV+j5txOjCqDu0dDnCA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:7lBb+O1d/ouJg7Lfc8lEiHtds+dYOVpk6cSMXxshTPk=:jCQBzrMRHMYmV4X/NFeJNre/yFS0ul0K1ITy+3Sohl8=;
X-ME-Sender: <xms:ZDcFa005t4Tsn35kyUxcAsUO7ikL0EwUcYewbDaduRBxlNHtx2KVug>
    <xme:ZDcFa55nCZTiO3N5M72cKUvep7Gh5SNanEJS-4bpuhtZNpJNEc6L_-tAWm65AyCiY
    l6xFE3EoZrC147PJqdFSxlMu4-mjDHHEqVu6Zk5frFi8GL8525ESGY>
X-ME-Proxy-Cause: dmFkZTFjqJTV9U1UD9XhakPDp/1A1eVhMznDGJdp+UbmQjqWfASIcbFUQbdFiDpjyjblLW
    asnYkoNWrnIXfnsDt5m9R1cOMcmJxZmr3ayI9D03XtUC+H+UZaA6T5IYaHD8NtMjUGn6mr
    JjbTHUZlrY4t3uzeHXon7+WkuWpRWFQ2CuxJ+WXsvWzTyrhFkSaSe0DL052K1nR5eNyf8C
    AWDCJ3SH6AtOQ1QZn2sCG0/6yCWGoCrhNl4wpyP170hOKjHJyXOJOO4bG6u2y0nBUL4jiR
    xgqsTwpB8HhryvHJyPQiWGGjWqsdAmAU6mRQdvzc9GlFaNZ/PnGFRzOcZiVUEkvusxY5lH
    22563+xf3C2S5mgOP9EWHBjCJOqvPTknirN1uWoN+G09f/4ryo4X0dRDDYQQkIawQGPeKN
    S7I6NDhd06hte4GNqCeZ+VsRrj3OFT3JHCIcwbUe+S0R9WVIaxaoBUxyZExV19bhfYEiP0
    gXS1kH4i0FxzuOzu8zg4I4YuTroSftqMicRo1mY58FvhdoQXOaCIa6fMNdpu8lnaLWTw62
    VdFIdUf7wpqz92QlY7KKS/tLwEO0sQxahqSbCR4KAdB4oXhEM50yOI7tXBTs7IIyarlvgc
    jqLeAKAxmJ160Lh3Vt6FkDTNqpCmX07f8w+P58Knf7ThGVy3r4odmACuDgiQ
X-ME-Proxy: <xmx:ZjcFaxCVwhfuSBtAFaPBemBkT1EPNksUhju1aMRqkiB3LCKgfvTiNw>
    <xmx:ZjcFa4cxgj5iYaTpe9O8Py0IBA5xuiWzvXUseguaxnMcVAp1JV0hiQ>
    <xmx:ZjcFa4Kom6bZrYIYNvlymPcopPxkA3UcX7tyc1vn1M1deUmwikLb-g>
    <xmx:ZjcFa73M9NRfQvVkpM2xDsZhZSEHa9uWkC5LwDsSgNFvU4ECP20S4A>
    <xmx:aDcFa2s5MY0o0f9Or9ffUHgy359i_9hUuxT7T85W44fdgJMvAJIklor->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id C34AB32A009E; Tue, 24 Nov 2026 02:06:12 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AO4aKsVRN-hk
Date: Tue, 24 Nov 2026 08:05:52 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Daniel Palmer" <daniel@0x0f.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Greg Ungerer" <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org
Message-Id: <8d2febd9-3912-410d-898c-16500d2692a1@app.fastmail.com>
In-Reply-To: <20261124025555.2348580-1-daniel@0x0f.com>
References: <20261124025555.2348580-1-daniel@0x0f.com>
Subject: Re: [PATCH] m68k: Define the m68k-specific syscalls with SYSCALL_DEFINE
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 24, 2026, at 03:55, Daniel Palmer wrote:
> On m68k a syscall handler's stack arguments are the user's registers
> saved in pt_regs, and RESTORE_ALL reloads them on the way out. The C
> ABI lets a function reuse its incoming argument slots, so anything the
> handler writes there ends up in user space. SYSCALL_DEFINEn() stops
> the compiler doing that with asmlinkage_protect(), but sys_mmap2() and
> the other m68k-specific syscalls are plain asmlinkage functions.
>
> With GCC 16 and a kernel built with -O2, sys_mmap2() becomes a tail
> call to ksys_mmap_pgoff(), which builds its call to vm_mmap_pgoff() by
> shifting its arguments up one slot in place. User space gets d2-d5
> back holding addr/len/prot/flags.
>
> This issue was noticed in nolibc programs that are using mmap() and
> I initially thought nolibc's m68k support was to blame.
>
> Define sys_mmap2(), sys_cacheflush(), sys_atomic_cmpxchg_32() and
> sys_set_thread_area() with SYSCALL_DEFINEn() so their arguments are
> protected, and make their prototypes in asm/syscalls.h return long to
> match.
>
> Fixes: a90f590a1bee ("mm: add ksys_mmap_pgoff() helper; remove 
> in-kernel calls to sys_mmap_pgoff()")
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>

This looks all good to me, nice analysis and description!

With the follow-up fix you posted

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

It would be nice to also wrap the other four syscalls that don't
take an argument for consistency and also have them use
SYSCALL_DEFINE0(). Can you add a second patch for that?

      Arnd
