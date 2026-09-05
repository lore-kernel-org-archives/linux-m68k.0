Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E12492530
	for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Sep 2026 12:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611393; cv=none; b=P2a7oHDxcxeeapPoxoLfug3tuGKA5nlCdSaXwDQ/Dmx0DtGDoaATi8jcrckDDWUGuzA2RHL274WafrGI6llLRtCje3gx1jkV4hWKzdI4fnKD4oxLhVtwA2ihscXUz/9jTUdFYhVYg/KulyPqxgVCI6m8VvAWaZL4CDqI7+qCbbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611393; c=relaxed/simple;
	bh=hMg7RJefHBNDjWx7qlSUPFnIqApIedOx+ccA1coGGAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onGgqVKKnZ26AcaO3eBeN3/WYW39xZ0Nb0ko72eVBrYcR5+m7CBuJtky1Wydv+UQMYJdLcW57oi/ZF06YuntIOulBeFNfULRYEbjdyXyFZn55EoTanHILXooNFpfIa4xio5f5ZuIw8+EZ3BSxZPJzC18J4a3z0LvAml0dF2iquw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+ows/c4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+ows/c4"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso13601035e9.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 05:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611389; x=1789216189; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IR0+lkethKHvrwCdwLXMATakzMSwaAKd6EpWxgPc0oQ=;
        b=b+ows/c4B9y7ldKFTyKcEQs5WOXjPF3mmBhOqDB+a1Ge3RVUxp+u585HoGNgqTQ/Kl
         5dQswaFZvxKYpgOsJutRJCLMdi1EnAOvcKXZ/VYlQMQweXxCYKCC5+tSoVkOns6TgoRN
         76TGWSvtWIDApHUrmrO7cm1p/w5f0OarW19oytxUF+ToaJyFeUktqippLYZAGb3uPb55
         qu9ajlJ5CSWjikvLKhb1IHLzT8Ukq5IOoXcFk+eKSTpdiGeuKWXSl3xzNqgHvb051YFi
         QiPgYK9EdnprYUQelS/DcaNv50O4XWrxsAAHFbYkvwEJicPC8zBW/nSEEHAx5yA4uDlJ
         CmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611389; x=1789216189;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IR0+lkethKHvrwCdwLXMATakzMSwaAKd6EpWxgPc0oQ=;
        b=gPMVOVlavItCaHt0qOWvdgQkXtiMCC3Rjpw8/7yP8gyI8ln13KrtNaWx1dQwtKRv6x
         bn38LIYJlxsqO2A9qw4bTqMeszq/ebS5vYyDlZkpkg9lW85sj+NTSOanF4D6NaA6sdjI
         IZP7GqeQmqxu/s+32kpOa259P5G4xJip155146BtY4NUZSk9an2cl94fKCpi+auUQ9qX
         rvddpUOWvBOSy6eBYEXw51lfgh3LpFnz4+7gdtspETfNMEReXZqOYrG7p01aes6Bayjw
         JjgelgUdO02MgCyJ1b9hziQPVaGgD5oYMrp8ZrdpeQpXXFHw6KYMod9soKo1/e0iM6dS
         e2WQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtjNL3KMIXkw/ANB7ZR1YurJ+FPs5Q1+cMjVgmLhG+NkQz5iLb0DvFvNB/esQqBL5g3bQ03F3vSI+I@lists.linux-m68k.org
X-Gm-Message-State: AFuF++lzoLcmJRJGOHrY4xwWfjCLmp/z3nYMIQFksY53QRSapO0Nm9/x
	SwTuS6Lciq48+UI40hwniVUugZL7GVty9xENKUyfdK9ql5HipsVuLP7c
X-Gm-Gg: AYBFou0zJUhTXApLYwePhtJOlo+y/fYArrgdL0CE+i2M91biWvtSQWcY33BroscMWr5
	xb+Kt0loDe0nhevS91fClp0s3dMCZitk04nwLA7tc+2A+3YLfL08LGOCqoF0X3KkQq1PVCWXQUN
	yvsx3R7bw5/3TcNzavyh4lf92wFWpzuybCIK3+MuSUnRXxv1qyxpiKU6J9PlLczf18xIVXLs9Qw
	e+sfSLfJ/0iptQjonvzCMOlGF99S0KcIHx1khHlsYyUg0ogNYzuAMC8kWTUoIrIZakKnY96mxw6
	XBtXa6iJXpGDJgZfcnqwNEY/+rUUzsgpnCstp3N2rEQXLLRvHxd0bW9eE8XSeKIRyEkLMGFQKCb
	BcRRs097c1NbK6hT1F0zWBIopJCIrdL0iwWhDMmd5VAkhEAv+xaW9I/K/39BJO6k2KfHSLQLbit
	cJ4A3moEWkWoFetOET0PJLcZiZIKms/NSSxvNbl/cLFKqwoZZn6Asl5D3TrAW/BOtmpVlf1j+x+
	BmuE+ZO8FbaIKmSJp+pgVuQfrKXLCCmXOOA/avp9srjiOVH2ZQ3+j8uLdsC6UknJeqBDlke/SOL
	FOvwy+Kyr+24Ui/BddRnFKwnYnmNOK5fPfRRj2e0VEX7qz5MGFf04Bx+AgkIcB5k
X-Received: by 2002:a05:600c:3495:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-49cf8244bc5mr116977535e9.7.1788611388275;
        Sat, 05 Sep 2026 05:29:48 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm118555475e9.11.2026.09.05.05.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:29:47 -0700 (PDT)
Date: Sat, 5 Sep 2026 14:29:46 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>, 
	Dimitri Sivanich <dimitri.sivanich@hpe.com>, Mike Travis <mike.travis@hpe.com>, 
	Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>, 
	Kevin Hilman <khilman@baylibre.com>, linux-omap@vger.kernel.org, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	Ethan Nelson-Moore <enelsonmoore@gmail.com>, Michael Schmitz <schmitzmic@gmail.com>, 
	Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v2 9/9] docs: kernel-parameters: Drop the pata_legacy.qdi
 and pata_legacy.winbond entries
Message-ID: <apwKitEmOv3ZwLkd@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
 <20260905094649.41996-10-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905094649.41996-10-kmehltretter@gmail.com>

On Sat, Sep 05, 2026 at 11:46:49AM +0100, Karl Mehltretter wrote:
> pata_legacy no longer has the qdi and winbond module parameters:
> commit 3c4d783f6922 ("ata: pata_legacy: remove VLB support") removed
> both together with the VLB controller support. The entries also refer
> to CONFIG_PATA_QDI_MODULE and CONFIG_PATA_WINBOND_VLB_MODULE, which do
> not exist either.
> 
> Drop both entries.
> 
> Fixes: 3c4d783f6922 ("ata: pata_legacy: remove VLB support")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> Acked-by: Damien Le Moal <dlemoal@kernel.org>

This one is actually a duplicate, I just found out. Ethan posted a more
complete patch in June that removes all six pata_legacy entries which
commit 3c4d783f6922 ("ata: pata_legacy: remove VLB support") left
behind, this patch covers only two of them:

  https://lore.kernel.org/r/20260607064053.195166-1-enelsonmoore@gmail.com/

It has a Reviewed-by tag from Randy, but does not seem to
have been picked up yet. 

So I suggest: drop 9/9 and take Ethan's patch instead.
The other patches of this series are not affected.

Thanks,
Karl
