Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473153E49F5
	for <linux-m68k@lists.linux-m68k.org>; Tue, 29 Sep 2026 14:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790692434; cv=none; b=Ixag/rfyCtKmQ93tF6yKNq/d7DvE+LsqKTc01TIAzD2oi+j0orOKQFttgeqDYN0O/tFDYMo3IyX5oDs2muTYBYRpEloklE4Czjp+yQFhGJcifZ9KZDXIdhsnyNz9sJg704TCGjZ4AVt669dj7DvSCZLzIA56cverCc+ETJykW84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790692434; c=relaxed/simple;
	bh=Ictfo6ayTgeVzDX16BAuhDJZt7+ZVbpOljn2/hm1F4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyttQg49y2DArU8xpjO+Ks5YqTKiuWyUGJoJjtNUWaoZ4TiDAh5KtTquxzLNdKUeVw2O7YtWDCx2KZq7dBpCLkm/3JXn8At77EvPjynhK1Rx9h7pcQU7Js4cYEy2yav/0YfeBlrQsFuAZWsRxxn/7QowrkBB60m13is44OPVsEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmqFO0ac; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmqFO0ac"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4aa0f1a94so1467614a12.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 29 Sep 2026 07:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790692433; x=1791297233; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=43/3dmeDG8ZHEWDYTwQfHePyNi6D0sJRBJ/5pN8ksjc=;
        b=MmqFO0acEMNzI0QEBUJgKmIf3MH5wqinoBlqe64cbyOM0IJ2ErxsNFGQI1BQKCcGYa
         +eAZbTA1AEXQFB2IXtJbNr4KKKm/ninfEqIc75UhJ8TXOt9xxI8IUR6fOfYY24385JSX
         6g3sWfnGVxao9V2AiaUqby4yX74DGBATVB1EeSwL3yF2Ng8mpXlyzlVOQ1yqoO8KXrEd
         auqMgyClOd0tntbi0RtWWVo5WikPQ14yfl+rNtZqVCDR3d48E33OP7hG7EsbVqoHeinI
         bhxqxBQWoWBJ2u1YJG1SgyYx5fOmGlgLtQLoukzcriHOeps3DnsQSQaFIoi5TeuXs4af
         NG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790692433; x=1791297233;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43/3dmeDG8ZHEWDYTwQfHePyNi6D0sJRBJ/5pN8ksjc=;
        b=uq8sKlUhOmphbXWQgH5pckpt8/KpAj4mdT7j7zWjN9LCygP0OrWkI5K6zGW5YdlEZT
         ACq2Kdhci04uUduOQ3dZY6Sqvxl9A5EmhwShrDXXUI8LaACd48D4GowkVfcBjW/Dwx0t
         2mKvrl9DVFU9gAzM9lr9rkv24d9aLddr1knNjXWpt0V2nhXRd/N9bunURg7x7Du6iUoJ
         0ZznD8FDaSGQ4AV6LEpUZj+vkCQDPQx6RQEM+s11kk6Px5clPYqr01jDmrmYGxO6F8y/
         pRgCInUNEgKB8bL26f5+5OvuavFJq5Woc2pdr9cKvKteHha6t8Sog/9RkmTQVW/UghIS
         eZWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpacr52l6V0287q8A3bnJ8sEm1y+/UVeskRB1qpVxbIuHDS1o3TIHd7CL1meg155tpaUePPJc/n/xg@lists.linux-m68k.org
X-Gm-Message-State: AFuF++ltc4Wr4SZD3hdDpS4pMmOWHIW+F3DjTAeO9W+uiEyq7rvXdq3Z
	MyUETCONI91zW5wR9D69Akms+vw1/jFVWdazr2VNxqECHe88Iloh7jRO
X-Gm-Gg: AYBFou1W6vCdxCylK5QZhCQScSpEwVw/Q0aWYWguNoFUbPUoGDfl0dltNphig1nUBcQ
	rZGYJOI7MQ+/WVLMA1UXpeVDCOBaZWIdniyytJESZ/C2G/zoqhRRYqMp7UD9/9dYmuS9ugT1kA5
	2TbVo1XHgZ0FLrjURx8PssfwFK9dm+0hOZ9iM6sm2kVTjuTaBEcKJzFyjVH8YNxQOvjL1laqzf6
	Ffn0XhTyIqVBWcELxt7s/gMFFn/17TWZgbv7nxa2KG93n6+BLVBEcLw4WXi/sryBgLtmU4nuCqj
	PqgZN6SfOTiuh2mz4pt/PrhPEZliiqHbsjTXpjxP29du+tF6GiTMAv0alggCiCXpYhSGch8aQnP
	2PNUAuMOCCbj1tJWB1F27owazmTwE2ZUPqz6WmlkNqsOpUG3NFtnHr1r1MVZo/0XbAaTP+rPwqA
	Y8mfXsIh4Ugpc25JHJVb5EcT6wITdS1rTLCQyxkOCC4fxzesc9SDAk4xgEysMAb0tUH4E89Rk=
X-Received: by 2002:a05:6a21:6089:b0:3b2:a809:1000 with SMTP id adf61e73a8af0-3de0e6f07edmr15049574637.3.1790692432560;
        Tue, 29 Sep 2026 07:33:52 -0700 (PDT)
Received: from google.com ([118.150.148.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7a3bb2d5asm4339524a12.17.2026.09.29.07.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:33:52 -0700 (PDT)
Date: Tue, 29 Sep 2026 22:33:46 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, ast@kernel.org,
	daniel@iogearbox.net, eddyz87@gmail.com, memxor@gmail.com,
	andrii@kernel.org, gerg@linux-m68k.org, rdunlap@infradead.org,
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, bpf@vger.kernel.org,
	jserv@ccns.ncku.edu.tw, marscheng@google.com, eleanor15x@gmail.com,
	Daniel Palmer <daniel@thingy.jp>
Subject: Re: [PATCH v6] m68k, bpf: Add initial BPF JIT compiler support
Message-ID: <arvMSjbC23bPf3l-@google.com>
References: <20260927205501.672807-1-visitorckw@gmail.com>
 <CAMuHMdVcpHrxg_Kb1vpguSYbRg4CU4DxNuPAv3UqHNHZTNk33A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVcpHrxg_Kb1vpguSYbRg4CU4DxNuPAv3UqHNHZTNk33A@mail.gmail.com>

Hi Geert,

On Mon, Sep 28, 2026 at 02:15:43PM +0200, Geert Uytterhoeven wrote:
> Hi Kuwan-Wei,
> 
> On Sun, 27 Sept 2026 at 22:55, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> > Add a BPF JIT compiler for the m68k architecture.
> >
> > The JIT generates m68k machine code targeting m68020+ processors and
> > coldfire parts with an mmu (ISA_B/ISA_C). It excludes plain 68000/68010
> > and non-mmu coldfire processors, as it relies on 32-bit branch
> > displacements (b<cc>.l) to handle large bpf programs.
> >
> > Tested with the test_bpf.ko:
> > test_bpf: Summary: 1061 PASSED, 0 FAILED, [1049/1049 JIT'ed]
> > test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]
> >
> > Tested-by: Daniel Palmer <daniel@thingy.jp>
> > Co-developed-by: Greg Ungerer <gerg@linux-m68k.org>
> > Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> > Changes in v6:
> > - Fix kconfig sort order for HAVE_EBPF_JIT.
> > - Update eBPF-JIT/arch-support.txt
> 
> Thanks for the update!
> 
> Are any of the issues raised by the bpf-ci bot valid?
> Thanks!
> 
Yeah, I'll address those and send out v7 shortly.

Regards,
Kuan-Wei
