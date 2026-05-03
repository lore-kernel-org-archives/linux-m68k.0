Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8862175A8B
	for <linux-m68k@lists.linux-m68k.org>; Sun,  3 May 2026 17:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777830766; cv=none; b=BQLtLIJMak3nYKxGe4sK6qDnaBOVi5q7a9qacOKhO/hwqJ0b/rk+qPR8y1UInY5jzrdnyFsm26BBMlIa4HaAlMdjZxaA838I6zJktG+mRGa+wBe+O5bBHVy8/SbCZ44lSVW/JOJ5pA2IN9QwLbQo8lDA0wWbbJgVms2vRUY1klg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777830766; c=relaxed/simple;
	bh=miLFvt7EhNiAlNwVMV+hibZ0YnJTrxy2WaDHFXqFBVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BubRGtH1/P+F7X9Vw4jj59KKrF+PIvm6De42rZfOkvaWQkkovK2vQ/je6y9jZeOuKEe3vnE/DfMFY9eUrCxe7/2SG39TRjfsZR+w3ikcwQO8Sbay3TRO0xVKjj0WyMLfAZyytSn4VG4k6Je6DaipuTZrvRiDhM5emxUctfkpL0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTeShqCd; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTeShqCd"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-365313b86bfso314376a91.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 03 May 2026 10:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777830765; x=1778435565; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BIOsGM34TZvB0EPu+0vpPxUmOc1xougDZkRZDU3Q73s=;
        b=VTeShqCdJVbaa+sW2U+BKtDrECYis4zShS8xpJ5/zFrEH9yTwlarI7edGUbQZ9WCQ+
         6Sxjb7UXm2B1m/BogkrtbCQ5BNELm4zyokgKbqSTFg3lOd5yWI3TDKRibtj34pPhL6zF
         dLHXxK1YflqhQviCtqsKLv5TRljhUvP3ZTQRgq7yQngZocs0qoh6V9rOpHcrmZa5Uky/
         qNfW91+nSRDPcWl76X+JL6O45nKbHS1huBBg1q4vM4oX6melwhkB4ptCfWT2I43mzKNj
         5ljNjA/AJMrHLhgkZ6UPFvlNRF4z6zOxoMFt+31WybDS4K84Y+PyqGgXieN5n6viYwcr
         MQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777830765; x=1778435565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIOsGM34TZvB0EPu+0vpPxUmOc1xougDZkRZDU3Q73s=;
        b=Z1SNFV0bf2PKgm05XlxDqKnQ0KJS0WO5tvfMD0kSlbJB4sC6EoPjTojEZg6k2WEhOC
         VW0I3tfxmKRqIL7ijpH2ThWmPZsZsZ+TqrwJr5I4VNl/XY5ZURmYcmIkzOPh85Txh7lE
         qZ0zd189HLIeM0HiLIGRKQR+Irv80Vm11/KNt7Cf0t1VivvPAgPCqavjpMfgqs0bOTp5
         zIIf23DO+2bfHryNMcopUGeYCVmpcMO3PEXBLpLo179F8Ew+S9sHsUbL2m9sOCZLPJ0b
         B4A2zmcRtt6/COXX84nG7U1yQEdFPxhcTCCJBDtIYi/Wft3/STQ7M73rNi6Ids0iF1BO
         /BMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8sAXwFxL0OuqmMSNmihTlO5WAMWgrmLPBq4jGYG4M0NLpzUj+VVTbkRKhtAbXPCILCdyXd3vw/M1hx@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwQCZh383DWGVwvfJgupbATiAoMayrssaeo0URSE76Q3tlcSebi
	lJqR239nxb4+yilYFm/whIplG8liNeJsVP9Eh0S7/zQ8O9wRXZxBjBWC
X-Gm-Gg: AeBDiesHiaR9/sUDRLgpl6szaZAPTHSqxwYkp6y8ov8s7FREi9mAVwPc8ocY7kwejBm
	979UTGG2JCGHZjjDRLDybMXAV/TSuHRhjNhO+3wp8mfhSeUhjrel6iKa8c2W3IMulyVWD5C19C1
	Hu8AyvYD99Vz5yb+tQGhAPMTghJEVS/mYE6l5LHYuwI0fr1R41bp/cGLR5F0eUnEvbOnm3BOUuV
	Tq8LNaL2xk2rnRcVe/y+gSPKdtXJ9OTvVyiy+T7Uh0VclLV1xcFipzh+jbPjgDWWGMvKZIe7pNt
	ibnySEWSCWn3Ul1oO4/OBoLnwObSN/VbJca6/GLqKDMl1kVwKuLGro14roWbJh2EdVCDVYyJkCY
	fhm/2MZ806J9MOy3dO+mdGkMI1EHQaWxToMwgYTSW7aIBb5rK99OslP8UDIenjbcRJrObwdYRp6
	IfpxnT4iTphskSxOmqeFLRGJ+QZgxKvMsPYCBDLSjxdx5Hv/DCFtxXl/SshiJT5CWoOn7t5YGCs
	wvYDc6A
X-Received: by 2002:a17:90b:58cd:b0:35f:b7c1:faad with SMTP id 98e67ed59e1d1-3650cf46e39mr6719559a91.25.1777830764967;
        Sun, 03 May 2026 10:52:44 -0700 (PDT)
Received: from google.com (61-230-38-200.dynamic-ip.hinet.net. [61.230.38.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bdf54203sm11772435a91.7.2026.05.03.10.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 10:52:44 -0700 (PDT)
Date: Mon, 4 May 2026 01:52:40 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: geert@linux-m68k.org, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
	jolsa@kernel.org, jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next] m68k, bpf: Add initial BPF JIT compiler support
Message-ID: <afeLaDbKdAB0MQYq@google.com>
References: <20260429124046.3480827-1-visitorckw@gmail.com>
 <CAFr9PXm0qxeSYq42MEOARKsmOT-hRLbT4UpchkwuSOMYKYzfOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFr9PXm0qxeSYq42MEOARKsmOT-hRLbT4UpchkwuSOMYKYzfOw@mail.gmail.com>

Hi Daniel,

On Wed, Apr 29, 2026 at 10:51:58PM +0900, Daniel Palmer wrote:
> Hi Kuan-Wei,
> 
> On Wed, 29 Apr 2026 at 21:41, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> >
> > Add a BPF JIT compiler for the m68k architecture.
> >
> > The JIT generates m68k machine code targeting m68020+ processors. It
> > currently excludes 68000/68010 and coldfire processors, as it relies on
> > 32 bit branch displacements (b<cc>.l) to handle large bpf programs.
> >
> > Tested with the test_bpf.ko:
> > test_bpf: Summary: 1053 PASSED, 0 FAILED, [1041/1041 JIT'ed]
> > test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]
> >
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> 
> Cool! Which CPUs did you test on? I guess 040 that is in QEMU?

Yes.

> I'll check on real 030, 040 and 060 machines a bit later.

Thanks!
I really appreciate your help with both u-boot and the kernel.

> Since you are doing code generation for m68k now maybe you could help
> me when I resend my patches for runtime consts support? [0]

Sure, I'll take a look at the patch.
Feel free to Cc me on any future patches if you'd like me to help with
reviews.

Regards,
Kuan-Wei

> 
> Thanks,
> 
> Daniel
> 
> 0 - https://lore.kernel.org/linux-m68k/20251127000505.2117956-1-daniel@thingy.jp/
