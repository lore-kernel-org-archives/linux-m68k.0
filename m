Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BAA3DB646
	for <linux-m68k@lists.linux-m68k.org>; Tue,  5 May 2026 07:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964449; cv=pass; b=iiz5wx1AnD9g7zHAqWIinCBxFJgRC1TT7E5hO14XjBnGwxH3yrL+r+5ZXx2aP2014EdVB7nFno34xGOD5az8MwKtp8FiMg4AnVrJv9LfYB5Qwd+19f4rTPSrfJSbaqvr6lBmZSp8eh8VP7rWSsIF/oO8KpUAewm54qdhrEPC7IM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964449; c=relaxed/simple;
	bh=fNaUy4JEgd7bwzjsrzd2PI7TZG2tO9lgcuJ/vKp6wQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c+G25jkzglN8RoSZ3enExX7Ni3MvzYyTr1TWE1MVtwmjJxvmjLcRGXo3SAwI/BfgmbHwTx9tVdeJZajO7pM9rP8l00JNx0lwHzv/Q5S2UqVUI8wofs8jTI3iy3QVgEtoyEFPpzUFsqPVM6Fzsx157kx9yWnTOSrcKJ40pwFdQyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=Cz8VRRow; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="Cz8VRRow"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-130a4aae5ccso2527586c88.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 May 2026 00:00:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777964445; cv=none;
        d=google.com; s=arc-20240605;
        b=CRP18ZUuQ1YdKvTospLLJliWJjCQUyf6vfsqYVCcDed7Z0Z33JzpU22HZy+LRESkeU
         otr2Oy591DtR7URrcj5ohD+afuF6wUjLxiH+mMFhL77vHnKntFG5EKolp8yerhxP+T9s
         ki73n1JG8JC98mSyLu9mDTgWJFfD6wAkvrR1Y8e5MKXNy1Kq09yNNiS8bdeyGjeLoI2/
         C5Jny2RQJ6jmr6Um8RbsgUJ860JF9K9TQ+kGzYQ6SRhKxXvENXSL631AgwiGC72jLN5V
         ONI5w12UvqT4ElrFGuclc+zrraS2lJX04y7ecgBmsjRaeVNyLY4LeEatfO/5ev+1rYz+
         FH1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Jm+rYaIrVP077A6xaWFYDY91HFVdV+ekVVmFuHZ77ac=;
        fh=w7GfZ7yerWl6newJ6ZQnvIwqcGDnTg54xXtTsHhWroA=;
        b=IpvJt/LvSSUyFhQYXWuJkBQbBhKmYCwdXXYURbP4S/0+bg/sjvNQ+0ubGv5PlhmDY6
         3kU3G4fpQsQo2ylz5ubYsqsPIA+1Bu73xLb7op+LrtJS0DzgEy4vU0ovePGGiz3R2kZr
         sephMPAow49s3r86HepUfyI1JGDsb0/GDD9S2IoWupwtZDL3iOzdZSIxEplBCE8UmuTZ
         /CL/hH3orq3XgD6w5xw/bNI+NhaPBqs08aZx5YQ+iSJEPNlfS4G4L7ASvmhbERCapCXg
         axQvNPmsvihfZ/G1NTB8ZhnEvfIl6MNDRUvRXJAGp6Zf60S8sCoKvgRcRZGwbTlFmVvb
         RCiw==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1777964445; x=1778569245; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jm+rYaIrVP077A6xaWFYDY91HFVdV+ekVVmFuHZ77ac=;
        b=Cz8VRRowRVGW69cRRfIIqIIoN+s1/GqHYlkUEy7R2TPA+ocALTFWs8FRtyGzJsVkTZ
         zuElYUcjiWhlUhuNo5H0luwNveD908G7H2qTjiYgCGjVHtv/KoHwc/AK19I3jp6MKbp/
         ZX5EdyQhnkuRq7aja3ZqJeVkLmS7DJmroBZ3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964445; x=1778569245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jm+rYaIrVP077A6xaWFYDY91HFVdV+ekVVmFuHZ77ac=;
        b=XTsT+25hmzd+BPABcK7i740xQh282nvtiLWBHiqjBSqhl/WN1Vw/SN0G5yuuBXMLP4
         sksXEuHsdUvZlXdAfckw9X8906Jc6AbVp7exTMvg7ETqotLAGxz6RsbxhzUmBfjtqufF
         SzsCrwbRiwfAkT0QiyaLa9w8EjmKqEZaO1U7wlaTToambAFZ9MxwRJpLV4aTi6ouz3bV
         ZR4RC4KkWnV0wl4O/iJUBsrr+XJCs5CflD5DTNnEwjYuG1qQHih1qw08nE9IjSZmqqYM
         LhPsXTFF0zbmt7EWy64BZ/JzfGGBXARIem0D/DR8psnS51x9ZoZr6x4Bkz7/em7DGO8d
         hCTA==
X-Forwarded-Encrypted: i=1; AFNElJ8K+/sYknT+l9N3Lyd0NwBL4yIhrpeQ/yhOosUuDfPAKs5fonHP0nGUeDnOryvkJNPiRIYdHLNfg4Pp@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyZ85t71sSfthqECDB8KFklfC1z3k/YIT/K1qNjN0mk7z4r55nn
	I0f1UoKRbeZb6gc6K1IWVBSPqMVkmNRZAklFcjnD7tKCLQTMzFDhpbQrdgOJiigZo0LwyLa2sr8
	VA6/NyOYK+pBdnYUU5Jv9pnU8K+aSvd3kvHJJ3lBr7A==
X-Gm-Gg: AeBDiesX+kQ6NenGGjSC42bMUkpmLTAWCB9OiviTkb44yFfQmn42KFWX+oQuQKFHnW9
	jIYqbqbWNdeM+4RFxbEVr2A6jOfYnRAwQsRNt89NPgYTdCHooxKMaki6BgQUdupsUnSeKIHStYb
	+m4/CCwBlhWPs9j4ylQFRl+azAzN+QAGNbOrn9J/zV3jaiCauEgJLD4vzaR8BhJGksNlW16uLHC
	wf2WX+ksoHcySOvkcqU9MIu+e2x+13jBKZ4bs6dfbXfNopvm0zx5hmlV7roojrtHWU5SjJ+GoMp
	ojMIEb/PcWmeEna4xi94
X-Received: by 2002:a05:7022:327:b0:12d:ce34:3f92 with SMTP id
 a92af1059eb24-12dfd83a401mr5902092c88.31.1777964445094; Tue, 05 May 2026
 00:00:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503181504.1037640-1-visitorckw@gmail.com>
In-Reply-To: <20260503181504.1037640-1-visitorckw@gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 5 May 2026 16:00:33 +0900
X-Gm-Features: AVHnY4Knljmbad1uAV-c-Ej0bF2s3_zZ_vBMVSTnG6PT4pfSJpN8GeS8OCMKyKk
Message-ID: <CAFr9PXnLSM8PA6zhLY0z4ck79EZtEwcduY=K2kLbzRh8QrfP_w@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2] m68k, bpf: Add initial BPF JIT compiler support
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: geert@linux-m68k.org, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, marscheng@google.com, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Kuan-Wei,

On Mon, 4 May 2026 at 03:15, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
>
> Add a BPF JIT compiler for the m68k architecture.
>
> The JIT generates m68k machine code targeting m68020+ processors. It
> currently excludes 68000/68010 and coldfire processors, as it relies on
> 32 bit branch displacements (b<cc>.l) to handle large bpf programs.
>
> Tested with the test_bpf.ko:
> test_bpf: Summary: 1053 PASSED, 0 FAILED, [1041/1041 JIT'ed]
> test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]

Results match on a real 68040 (Apple Macintosh LC475, 1993 vintage):

test_bpf: Summary: 1053 PASSED, 0 FAILED, [1041/1041 JIT'ed]
test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]
test_bpf: test_skb_segment: Summary: 2 PASSED, 0 FAILED
# uname -a
Linux buildroot 7.1.0-rc1-multi-00465-g1f6c5a18ddbd #26 Tue May  5
12:25:51 JST 2026 m68k GNU/Linux
# cat /proc/cpuinfo
CPU:            68040
MMU:            68040
FPU:            68040
Clocking:       32.3MHz
BogoMips:       21.55
Calibration:    107776 loops

Also the time the test took seems to be considerably shorter with JIT.

So:

Tested-by: Daniel Palmer <daniel@thingy.jp>
