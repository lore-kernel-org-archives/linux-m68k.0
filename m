Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E426F143756
	for <linux-m68k@lists.linux-m68k.org>; Sat,  6 Sep 2025 11:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757158989; cv=none; b=dzI3GHq5KVxbaJscgjRxom7Ko35ZyDQSW4olC2CIlQFwEmuiiGG3n3dz6srf3M/x2E4c3Cqy+rw2faQSXqGP1Bo5oq38wO/EW+STdNxNbuxiNMrlMb9D3bE0uK0YQXxc+NfunIp2gta0mDASviVTNrGkDqomWYx5Ntxy9mHQ8Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757158989; c=relaxed/simple;
	bh=nnHzgbiteTdO6Dn6POP6E6R5puQz4UN8iAYaejuBUyI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=opvFp8xZORYVUQIjdDH0kHpg67OBr/yjR2Qc2p0VLGLllEjhtzsWARfL4FwOYdmQDHEHYpD1f4LHbFBhAUShbz/gu3M+fr6aKbhvJQ95WnQRAatY1rHYEIEpVZQQV5J4vEUtHXkRFua67a7Z29W0UwQcXK763G7wynCYf6K7ow8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izHsZ5+9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izHsZ5+9"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45dde353b47so1263935e9.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 06 Sep 2025 04:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757158986; x=1757763786; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XX0gUaO70jVaoVg831tZPUyT1i7m1025KT/B0Hoa7H8=;
        b=izHsZ5+95PSqWHyNBscDxNuc4F6dYp/A0ODBq4Q3Q3PVLNXsUzGNlsGOk3Ou8aM64W
         jxSo2drNLAdX4Gq+idy++ycmbu4pVgXoFSfdmPeQBs6LtYnKWnnF0q/5a+sYauuqiBwq
         7oHDKmbosxLhG0TCgTjXbrOGuuJdN51VvOR9v5OySaPWTq1HVFVj262Mb4tlfAzydaL2
         Aog0jz6Or4liZYj2FZmblqw8ZZ0EKNjNJabX+nh0IZiEW9hr8GElbsSGxyVI9zb6HKjP
         25xHljuUz7MCxW7cmpDPuLRs7VA98c8gfN/wju3qzxFtbH3nDQhtfl8g/q0A1yT557c6
         AcCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757158986; x=1757763786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XX0gUaO70jVaoVg831tZPUyT1i7m1025KT/B0Hoa7H8=;
        b=ToM0kn8rleX8y2/z0ADOStJsGet+lKV73VmNpZG1KzRLCizGtq/zat6KKcvi/eYk7O
         wfIWvuADLrlWb9Emg4bYq9pbEfGrKmoQ0PN+E9cPr1wtp91m/syR+Bl4qlcRUbsvr4Td
         mLHcRBvjqAxl47n4N8ZXYR5OLbPOFLikyD/NoX9/lCubtjD4Jq0qweLUYh/KZ4mfpfpu
         cpJ/KO1KnySNa8J9oofaMq+f7SNVrwA+n42DrNCHQ0c9qm9fx4E2q54Cp1w5YZgv41ED
         5K2rRLS4dVr3Rdy+etWgvuPQkeepz6oBfR0v83rA6rzwi9xnbuxL6qLGAaNBBRDnk+9k
         h7Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUfMDoBF4xRsH2yTXfSwe7PtNCdLy3L2pXKYEwC1mk2/QUn79ZoRA30Ue3B0B7yq+zKxDIYmbvv0sLp@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwIZ9yZZLBhXfxYO61VStKVkGYG264mythGneEhvPbMoSs/GN6N
	gA+vGNImMiyAWA0aoy5oOcS0EWD/3oU1duSUm/jt7S2tz+hRiC2jw7Km
X-Gm-Gg: ASbGncv8iboppllSlXOXnkf40NOpR3T3yK86lT/E4g3f3N2bARoty1Kwf7xZAeXeR02
	Hn2Da06AQ0Vwzj1cqYlg/D2SZ7dFbjqCweoDk+F+wGsrYQjItlbSA2Ks2liqbN/G9js04hxEEE2
	zi9E//1MZEWzNuDeupOrtI8WQ6ZpqUmEj6p2VkkPRWod2hAfiDt5mEtly1fxldcwJponaIZkkSe
	IT9yGx3ZQXccF91z20AmzwZKXKJUW6VvaPAHbvcxKYVjbDsVXHw9k/aUW1tZsy6SJM59YZhfu2w
	qRXOn41G5jSTvVctjELWrLy7nBwNFCdhOC51KhlewrONYBylCQax+EFIzEBsmlOXZYUIgw0lTMb
	ugi7skxtkomQT5eSzd9lMmWiBly57tyufu7iaHMdEoXshHljNj3hFQQiaE9vNNL6o1e79bOhjZX
	I=
X-Google-Smtp-Source: AGHT+IGQxryV+OqAci4zzJWd4jBsJHSl1Za8Pl683cpc6xoQVU8fxwCG7Jv66hj2eCX32tlAbKw3ig==
X-Received: by 2002:a05:600c:358a:b0:45b:9322:43fc with SMTP id 5b1f17b1804b1-45ddded6b98mr14323965e9.29.1757158985919;
        Sat, 06 Sep 2025 04:43:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dda6da5casm61063435e9.7.2025.09.06.04.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 04:43:05 -0700 (PDT)
Date: Sat, 6 Sep 2025 12:43:04 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lance Yang <lance.yang@linux.dev>, Finn Thain <fthain@linux-m68k.org>,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 mhiramat@kernel.org, oak@helsinkinet.fi, peterz@infradead.org,
 stable@vger.kernel.org, will@kernel.org, Lance Yang <ioworker0@gmail.com>,
 linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH] atomic: Specify natural alignment for atomic_t
Message-ID: <20250906124304.6dc17f1f@pumpkin>
In-Reply-To: <CAMuHMdV-AtPm-W-QUC1HixJ8Koy_HdESwCCOhRs3Q26=wjWwog@mail.gmail.com>
References: <7d9554bfe2412ed9427bf71ce38a376e06eb9ec4.1756087385.git.fthain@linux-m68k.org>
	<20250825032743.80641-1-ioworker0@gmail.com>
	<c8851682-25f1-f594-e30f-5b62e019d37b@linux-m68k.org>
	<96ae7afc-c882-4c3d-9dea-3e2ae2789caf@linux.dev>
	<5a44c60b-650a-1f8a-d5cb-abf9f0716817@linux-m68k.org>
	<4e7e7292-338d-4a57-84ec-ae7427f6ad7c@linux.dev>
	<d07778f8-8990-226b-5171-4a36e6e18f32@linux-m68k.org>
	<d95592ec-f51e-4d80-b633-7440b4e69944@linux.dev>
	<30a55f56-93c2-4408-b1a5-5574984fb45f@linux.dev>
	<4405ee5a-becc-7375-61a9-01304b3e0b20@linux-m68k.org>
	<cfb62b9d-9cbd-47dd-a894-3357027e2a50@linux.dev>
	<CAMuHMdV-AtPm-W-QUC1HixJ8Koy_HdESwCCOhRs3Q26=wjWwog@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 1 Sep 2025 10:45:46 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Lance,
> 
> On Thu, 28 Aug 2025 at 04:05, Lance Yang <lance.yang@linux.dev> wrote:
> > On 2025/8/28 07:43, Finn Thain wrote:  
> > > On Mon, 25 Aug 2025, Lance Yang wrote:  
> > >> Same here, using a global static variable instead of a local one. The
> > >> result is consistently misaligned.
> > >>
> > >> ```
> > >> #include <linux/module.h>
> > >> #include <linux/init.h>
> > >>
> > >> static struct __attribute__((packed)) test_container {
> > >>      char padding[49];
> > >>      struct mutex io_lock;
> > >> } cont;
> > >>
> > >> static int __init alignment_init(void)
> > >> {
> > >>      pr_info("Container base address      : %px\n", &cont);
> > >>      pr_info("io_lock member address      : %px\n", &cont.io_lock);
> > >>      pr_info("io_lock address offset mod 4: %lu\n", (unsigned long)&cont.io_lock % 4);
> > >>      return 0;
> > >> }
> > >>
> > >> static void __exit alignment_exit(void)
> > >> {
> > >>      pr_info("Module unloaded\n");
> > >> }
> > >>
> > >> module_init(alignment_init);
> > >> module_exit(alignment_exit);
> > >> MODULE_LICENSE("GPL");
> > >> MODULE_AUTHOR("x");
> > >> MODULE_DESCRIPTION("x");
> > >> ```
> > >>
> > >> Result from dmesg:
> > >>
> > >> ```
> > >> [Mon Aug 25 19:33:28 2025] Container base address      : ffffffffc28f0940
> > >> [Mon Aug 25 19:33:28 2025] io_lock member address      : ffffffffc28f0971
> > >> [Mon Aug 25 19:33:28 2025] io_lock address offset mod 4: 1
> > >> ```
> > >>  
> > >
> > > FTR, I was able to reproduce that result (i.e. static storage):
> > >
> > > [    0.320000] Container base address      : 0055d9d0
> > > [    0.320000] io_lock member address      : 0055da01
> > > [    0.320000] io_lock address offset mod 4: 1
> > >
> > > I think the experiments you sent previously would have demonstrated the
> > > same result, except for the unpredictable base address that you sensibly
> > > logged in this version.  
> >
> > Thanks for taking the time to reproduce it!
> >
> > This proves the problem can happen in practice (e.g., with packed structs),
> > so we need to ignore the unaligned pointers on the architectures that don't
> > trap for now.  
> 
> Putting locks inside a packed struct is definitely a Very Bad Idea
> and a No Go.  Packed structs are meant to describe memory data and
> MMIO register layouts, and must not contain control data for critical
> sections.

Even for MMIO register layouts you don't (usually) want 'packed'.
You may need to add explicit padding, and an 'error if padded' attribute
you be useful.
Sometimes you have (eg) a 64bit item on a 32bit boundary, marking the
member 'packed' will remove the gap before it - usually what is wanted.

In reality pretty much nothing should be 'packed'.

	David.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

