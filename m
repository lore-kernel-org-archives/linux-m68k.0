Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880621E32CF
	for <linux-m68k@lists.linux-m68k.org>; Mon, 19 Jan 2026 09:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816727; cv=pass; b=bt8P0N+wKzuCgpA6E6r4uhHQDYCSSj5DWw0eQKVP+qU77bbUJ/lw0Hv05QtKOXbtoLtysvUwswXay5qhlJF8HRawfok/WGTrGI0vKYargiqU6fDxatLIMayCCW3ckD20cL/hmbnIQyLiilOzifnJRzIFTlDPg00CK9JoZ/MNyiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816727; c=relaxed/simple;
	bh=bgWRz5IXYzSlpKdGLC+J/e/jgbLwTtsAdoKj7SGZTGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lxrgrBEXYmHx9A4g4hPcbJyamwN69M2TG7JQewl0Dwb23NXdCJnAB/spBCjsw08KVk8GCN3C2Ty+qlR2Dw8LG/NhBRD610x5w+e3Mi5Zws6IhqFFiMJzh1bWe/ZZgcCqR4Wl01rWSmnt3wsk7ruELUqBZ7wt8KrE3OtOypfzyfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=m3BjyBFN; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="m3BjyBFN"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34be2be4b7cso2396345a91.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 19 Jan 2026 01:58:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768816725; cv=none;
        d=google.com; s=arc-20240605;
        b=NGepKSRpA79LRAPT7nCyyr6IPtvQrSIqAONT96PsNiRNpX0siqUP4bXsk8h+9F8lqz
         GAPv8BrrfLliZkeoj+WLUNyhHIexz5ARypjQCREXIQe58NmEbcaYcNIRpnGhAcbL9p0Y
         Ylb6abGJ1e4QB4XzG+2bLwR7YeTii6PJceNg/UYe6Yvz1GcdwgmiX+WrwGFCsRBwVcV5
         NQ7WVUgk+8aGdOneB9tUEjHFzdTcmq1XEllmj/UJ6XS8m3DAWhS1lYPehozMxylyvkRR
         8Iob7jnN8VlRlCVleiXWGwWP4Vhi2xe6j5MCBZ+e35YOJMB+k4vOtVqqKTdKhG81Rqso
         6h+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VkCfUUs1lZMPnFK0ieQMKs5PKvQ3AwfiDEpMQdiiIws=;
        fh=dM2BSrOa0eDyhCPPf4MhxkERweN7KKwuiLtCdWdm3Jw=;
        b=AXY+xp9ksXRA2aYThDCpwnGT09Dnm8MZeOxdfaEh41ZESTCBzGzZc/XcM2vETRgneA
         F6lMOREys837dw48Y4nG+VS0eReZi7RehELVmWINQVnx3kPsTomkPFC+KTXCBDjmuHGe
         64Gyu5J9SQA4Kodl+XNZL4QzFzSb1zu14aVlaQ1v2Ljd0wVv+70fN596K7ez2g5pz6dm
         iU1tZ/j3XNX0Pp7AicYdP5qzxM+G5WyKcvB5IeFj3Nh299knNspF/q1C73i/aiHqp7no
         cWnpnza9uCW1ODQOVclyUqdfowlu7DHbYGo9EmekgSX5INpCPOoA3WQCneQShsYdJA4g
         CQUQ==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1768816725; x=1769421525; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VkCfUUs1lZMPnFK0ieQMKs5PKvQ3AwfiDEpMQdiiIws=;
        b=m3BjyBFN8yBaGk2IDcED3dlzaBPh729MBXNhTr8A4nEj42eoujqmLfDtGabg/cIP60
         gyVOutIHXg5PVOZfVuBbkyiNdOP/PlfJ4gXPyDY8uvWDw0EXOAhW9EqGiQ68gBchcuIX
         Kp/C3Uw1VYBPWsYxpn6bj5uNJ2En9EcaL6iBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768816725; x=1769421525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VkCfUUs1lZMPnFK0ieQMKs5PKvQ3AwfiDEpMQdiiIws=;
        b=QpxKVQhrSQ01/hpU9b89FiTekuQLddTKGs8QalFSi2Ghg+4CONo1rDtiWQfDDVubu8
         3WoqOY69eA7LuFo3eDaU5Wp7OWaiarez/y2DChwb3ZgZXEzWuAk9XmGcMYA/cOCIyg1O
         fHaMOPFtiLQ8jb9NtG6116ao07NUYwvqdvuPEDKbjudaOccBiwsGFLiD/2HirzY/VQAr
         Of9iNZyR6LYU86EF5cEKymcc7/fnFAP4v1wkkkBJ5A8DkyjLlKXes/HzgJMLAdoOWNbB
         mCIIAuW3DfSgh6DWVItocwYwxPTAFKBhSa0wVw+smirvFoApw4rIupZsD91Ju1d37QBZ
         1Sug==
X-Forwarded-Encrypted: i=1; AJvYcCXB/1wDlzExGsuZuleo6dGGOYj41jfxL/vg7ytdJXf7jzORsAvxK74Me5E1nBsnH543MEy+D2F0V9Hk@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyjnQSHTw0/hnaBvfXXPZ//xEiFEMRrpUCTDtf/R11wvlupDz4k
	7lhqPBfSFr/SO/SezyairSGDNUx+UpUhkwBuReDVqAQ90CdGxBJM38obNkDBhSKqhg+0mzt12Yr
	wv77lbELRjg1euHKA1DlxKYbJPUC1M2tgOA9C9Ee4MA==
X-Gm-Gg: AZuq6aJ/EjKpTxBjoLHmZtOQ1Q8NbyCMaSe98aD1ffyt1rvnq21xDVr1g94pAhH2lad
	zg2cZshtrWXZW/2T3lDzgsbDQMLIH27ZmDn8k8c9tWsrYnSOfSKBFaed7ZDuqgFCrIhCVjZJoE5
	CLQfKWyHWh8DMpDxPtRSm0Oyip7mRqObYaphntDWBMS6Kdqsx3y3/V3OBtHOYqWQtyGXfC75qOI
	JZPwbXdaWt18ugxrmKOZkbcrgdceuEAa6F7xDEG8sTwF5bPVg6RtdE0NsGaST9Ki7cAbVXkuv8e
	vzC7bdqB+047T8FBHsqPN91TagaG
X-Received: by 2002:a17:90b:5803:b0:32e:3829:a71c with SMTP id
 98e67ed59e1d1-35272efcc92mr8536611a91.16.1768816724728; Mon, 19 Jan 2026
 01:58:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116122812.2421621-1-daniel@thingy.jp> <8daedc8f-efba-4d2e-9e2a-8954eb4acbc0@t-8ch.de>
In-Reply-To: <8daedc8f-efba-4d2e-9e2a-8954eb4acbc0@t-8ch.de>
From: Daniel Palmer <daniel@thingy.jp>
Date: Mon, 19 Jan 2026 18:58:31 +0900
X-Gm-Features: AZwV_QgQc_tcE5hxwKPuNAKvX5V_qXAH-isPiASWAHUBLbFPdxbwqsPbuqaHXCI
Message-ID: <CAFr9PX=7gMBW3_d5jSHa1A7YMrZwd60P82FzOhG8nxcg+CAVZw@mail.gmail.com>
Subject: Re: [RFC PATCH] tools/nolibc: HACK!: Add basic self relocation for
 static PIE for m68k nommu FDPIC
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Greg Ungerer <gerg@linux-m68k.org>, w@1wt.eu, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Sat, 17 Jan 2026 at 04:29, Thomas Wei=C3=9Fschuh <linux@weissschuh.net> =
wrote:
> Nice! Is it sufficient for nolibc-test? If so, can you provide
> instructions for that?

Not yet. I will try it and get back to you.

> > Questions:
> >
> > - My use case is weird/niche but maybe there are uses for static pie no=
libc binaries?
> While I would like to defer to the 'uldso' tool from Greg, nolibc
> positions itself as usable for single-binary systems. Requiring a
> different tool would run a bit counter to that.

I tried Greg's uldso and I couldn't get it working just yet but I
think I can get that working.
But I think having something in the kernel source would also be handy.
I worked out how to use it with the prebuilt m68k toolchain on
kernel.org too so everything needed to build nommu binaries could be
sourced from kernel.org.

> In my opinion it depends on the implementation complexity. If we can
> have a simple implementation shared by all architectures, why not.
> >   - If so what would be a cleaner way of implementing this?
>
> Some comments inline.

Thanks. I'll get this working on amd64 so we can see how much arch
specific stuff there is, address the comments and send again maybe
later this week.


Daniel
