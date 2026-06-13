Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9483A254D
	for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Jun 2026 09:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781342554; cv=none; b=Xwbl7BB4Q/rY+oym+2UAjCFweDWY/lVCseKr5DUQsjMpcl7G9dOdqIMe4uFjuEqnJDK295JEUVqR0OzTIy2twkBe8mhCFkWa7OJRBrKwMOE9U7uSs0l8qgX7M7l1fyGmXw00qfnX0b5Ppo4FZNoHvv4zoN3tgJbzP0qrXG2Zzes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781342554; c=relaxed/simple;
	bh=helDrwuxiWtrf/iPIy4Y9R/hkLMVrwdS0rRl6C7Dn4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VHhiyTt/Xmubh2pZk0ElJy/Uo5FmAtblohRR22x1dhCFCEiWgAEZV8c7CUCjR1X1IS2Ll30/6EuNACZ/BbDi7fvgvA3nzFI+gzsXenJA+a5wNpZElU6nskZSDEFbTbDKcNbId7bCx70EgRVuMi+MRXyBCgf01izp4gaLxjbTNL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SU2szgcH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SU2szgcH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781342551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dkSlrlMGjyQ/p88XPP6jRxfxndrJ9//6XRAvhwfy0VE=;
	b=SU2szgcHslCPncWD9tsy586twxeQlC764t/fb2mUd2aFwCNL28BcF244eSFlm3fUBX822o
	dCBRLhNZe0JD6m3TUCQn4/0XjYV+gljQF7GRLDYoivB6OpsnzU+tCUQn0zzlfwujGA1Nq+
	FnmY+2jhfA819gefcJR5ydlPhl+ULpA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-7bCZOAF_MHyTWa-qQgflnA-1; Sat, 13 Jun 2026 05:22:30 -0400
X-MC-Unique: 7bCZOAF_MHyTWa-qQgflnA-1
X-Mimecast-MFC-AGG-ID: 7bCZOAF_MHyTWa-qQgflnA_1781342550
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91598ab3a1aso203312685a.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Jun 2026 02:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781342550; x=1781947350;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dkSlrlMGjyQ/p88XPP6jRxfxndrJ9//6XRAvhwfy0VE=;
        b=arazvUp0IK4zY1NLl8nozRctFdU0BUenXdcpuUyXezVIbcomjU0g1mfjF2TRVkW2ox
         5u9pHCek+SYdf1oHW0dU83eknoxEO9n6CZosqQ5XID6qsigd4q6EZmUwlN+qvmzpJuaP
         u5MrPtyu1XJIxpv2jYZorJNfAoFCk6vVW9p4l6pBz8vyO/LtdtBFATwxzRgKwjqkfq/p
         czQf6KP2FlsUMo2z5XgZoxrYuDJXVMh/V90ot1wPPPI47PBUwXq3MegbpKir7qyoesJf
         oA/9WpRfSoQPllXPyK99xeqN1vpGM3EQyoAeG3mNr5Hsre9UWVtfeW9xB0Oimkx63USD
         ws5g==
X-Forwarded-Encrypted: i=1; AFNElJ+zBGTd8BorUedrD1ohFvg9+PEWM5Hlkn6NhreR/EWNDyc8Tam9jE6HoZ4JuIjBke16Q1IRebY5jXUI@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzqqyvuF0jZK/ZKFrqv8uLhFCeFZo3DxJSZocvzrZ83hLT9dTZr
	1j8EFZbIRvIipt/IsErljaqY/ikyKstVvbIWTqscnltUvOrFGRGfyW4LZDSRdXnvoYafGYZk55X
	aYrXSF8IOBKRjPbTzUthwgIAlJ7O0pQSjtLSyIeu2mtiZcuUZVEufaC/IWxbf4eXaQ/Z2GA==
X-Gm-Gg: Acq92OFXBgwMR5birkC3wrxx7ohiOoh9rNUiPHMRc+jHIgMMy512At7WtGZgIAj7I6r
	yyUzvX1hS2BAS6JDEGy09YRAAaGIcw9i3e0kcYCJwBh/FfjhbqJ6eTmT1zHjUM18SCHvx4sHlNe
	LzQA4d01FBiOTnT5jU+rRvRvnbzN+AnLMtT7ndr0qwnxQgDwUSMxHboreiKYBuJdTKG4feDpaW/
	fuk61lcf95Uu6ks+PuWGWgkXoKscM88HQSr2ILxvqJHE1ffDR9bTLP0fgsha4ia62ZkDXRY8Dk6
	zVoqHj4+9n4DIr3I7/y74yhS2/wTuvo1oc9vSU27oo3qDpLPokxFaQCpkQvhpbLPjOHpRBMnSCW
	QqpWhdybz+0ogfAP0Yfb+jHQT0cFhCcajmORwkZVWqI57LQy7mhUycU0=
X-Received: by 2002:a05:620a:4708:b0:915:cf88:1e41 with SMTP id af79cd13be357-9161bf6c4bfmr926952585a.45.1781342549614;
        Sat, 13 Jun 2026 02:22:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4708:b0:915:cf88:1e41 with SMTP id af79cd13be357-9161bf6c4bfmr926950585a.45.1781342549179;
        Sat, 13 Jun 2026 02:22:29 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.72])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f3c324sm454992285a.21.2026.06.13.02.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 02:22:28 -0700 (PDT)
Message-ID: <fe40891c-3fd1-417c-835e-6f1046db7844@redhat.com>
Date: Sat, 13 Jun 2026 11:22:24 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 0/4] m68k: coldfire: fix non-standard readX()/writeX()
 functions
To: Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, arnd@kernel.org, wei.fang@nxp.com,
 frank.li@nxp.com, shenwei.wang@nxp.com, imx@lists.linux.dev,
 netdev@vger.kernel.org, nico@fluxnic.net, adureghello@baylibre.com,
 ulfh@kernel.org, linux-mmc@vger.kernel.org, linux-can@vger.kernel.org,
 linux-spi@vger.kernel.org, olteanv@gmail.com
References: <20260609142139.1563360-1-gerg@linux-m68k.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260609142139.1563360-1-gerg@linux-m68k.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xkcmCeMZK2LjITqi9SI-Z3cJBG-x8uwpD5VfZX8QAY4_1781342550
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/9/26 4:12 PM, Greg Ungerer wrote:
> This odd collection of patches is aimed at fixing the non-standard ColdFire
> set of readX()/writeX() IO access functions. Instead switching to using the
> asm-generic definitions in include/asm-generic/io.h. The difficulty comes
> in trying not to break any drivers with this change.
> 
> The implementation of the readX()/writeX() family of IO access functions
> is non-standard on ColdFire platforms. They either return big-endian (that
> is native endian) data, or on platforms with PCI bus support check the
> supplied address and return either big or little endian data based on that
> check. This is non-standard, they are expected to always return
> little-endian byte ordered data. Unfortunately this behavior also means
> that ioreadX()/iowroteX() and their big-endian counter parts
> ioreadXbe()/iowriteXbe() are currently broken because they are implemented
> using the readX()/writeX() functions.
> 
> Patches 1, 2 and 3 in this series are specific driver changes that can be
> made independently of the final ColdFire readX()/writeX() change.
> 
> Patch 4 is the actual switch to ColdFire building using asm-generic
> readX()/writeX(), but also contains three driver fixes that are not easily
> handled independently.
> 
> Note that I don't have access to all supported hardware needed to fully
> test all these changes. I have tested what I have, a bunch of the standard
> Freescale ColdFire eval boards, and inspected generated code for differences.
> 
> Note also that patch 3 relies on changes that are currently only in
> linux-next, and are scheduled to hit mainline during the next v7.2
> merge window. Those changes are also available in an immutable git tree
> at git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git
> cf-internal-io branch.

I understand that with this series you are targeting the m68K tree, am I
correct?

A possibly better option would be, after that the pre-req patches land
into Linus's tree, to share an immutable branch for this series, so that
both m68k and net-next could pull it.

/P

