Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0B04CB8BB
	for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Sep 2026 16:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788626719; cv=none; b=sghwq1YiMP0GbvEv/QeHU4avDn7oeeap7a88Sumskawbl9XiE+onkipqCYUYQl1V/t2D1pV9WHkquepLx1QJxqPkYoz7mipQM7suPjSe10E52pmYQbgFRcDtRUNWl/30qz1OuGZWgyFbZFpJ/hP9Ut93XaJXm+34GrF8V9XPODA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788626719; c=relaxed/simple;
	bh=HdBAdLzSTzujbllvsJF4/4Myx4fdLg2P7yqQlusvX+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tB2BRckBYIi48JwXRq5G1h/fV0L3jQFmp/BI8VAkr9gDHFBOWCEQlZppHaOsnD31DxPLH9S1/DqITVNwaXMtPL2Hiux4mblZIkCbRiUVDe6HvKo43vvBNrle8UYfcbqP1I/xVEhr0SqknT25nVEpntyFD2qzXh0rA3llaaVUzHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjaAYnko; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjaAYnko"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b965570d7so24339675e9.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 09:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788626711; x=1789231511; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UXpqHFV2712rxC5fNse5LJiD7+paksBxEi1NQ+E0D5U=;
        b=gjaAYnkoPIfsz8ejsIbeOr13gOcsU/c02cXAo+bsXJZyFLtJ+CaaNjLrr4OYSFjtUz
         Oh7oeq2luCKpgOlDlJRTSJiAz+GyryHbEcn4VCIcO3QfF1w7fdJyUDoxUeYfqjWN8uBq
         vrYmBfZ4HaYsFUWT//bw62Dmytok9ehfBLVy/SbScgwxT/e9awLsi5iEI4X4+QbXLSYM
         0BPRBgcuIGRgAcNv3rTBVJ7mJbhsRCxNqHOKV8Vf8/kLfdS011SYB0Vh+Txqa/0RH9kb
         RjhIFMV4TYEZDHkP3DlRQ7RExVlgYU3oXCHwgdwSkET4FK8ZDmqxPhbVdHG1uj4a9mH6
         SErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788626711; x=1789231511;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UXpqHFV2712rxC5fNse5LJiD7+paksBxEi1NQ+E0D5U=;
        b=Vuxo+OfgFcnUnu/+b/d6KWcDp4tq67xqXVbKkyYP5C/V7VufAinnHEzgONTMIJ6QvP
         tYCxtu330bOTjeupwRCSqTUJsx3vGnNfNjbSbHzttiriTOioT3U4ow6ltSPniqfW5+EG
         Dj3fYBWHiC6JsdbxpUPbGxbY//5eewMCrWT7P6qFYn1fQjoYVc2bpuhtv/iMlpCfBBfN
         m2nbxOXokvWdqDGG3iByCG4QWmBVtOv4cE+u07DOvwSkg6Lm7uL74GJbgjjyTsSfbrlp
         kPMEBTUt8xfTJudcShc6UvEc4Ulod9066/OkHzsyMzPe6hk7pBs5ErSHohumTCOp95LM
         fUww==
X-Forwarded-Encrypted: i=1; AKwUvByFHG3z8702AaZAlFJ6fo/fEXdEnjG/7tJlfauEQ+lWbB0LYCBHZjxf5atd5VH2IiJFEYZ6lmO+xi04@lists.linux-m68k.org
X-Gm-Message-State: AFuF++nXWs4WF1e6N1aaBlUm1DYQSF2LCnH4CPpQPJa27fbdysmMV/TD
	L2t2Vn2uzxRcViPMUEe5xXZ5cEIwH9ih8xD4e6rLnSLM/0blYkRBKjnl
X-Gm-Gg: AYBFou3LKZxPhn/sBJtdyaDNkX8nMfOn1O1bW4D6o+SonZ2PNh3OP9ft04hNFXzhAij
	8JHncDhM+koigkTqN6TAigGQ9TWwaup2qEge1paPIcgUgN4PwLIks3GeVVRXORAJx3jiIdPX8Kf
	GL2WfWgek6kJZ9/dGYYwWsHHTlaYpBlhcIWge9MRBPesxXQ9DorHHx8Cq3eLL7gCluxZUrOXw3W
	bQPt35wJY4trPwDi5IaqBbTcxK/NDXDrWqqvrK248kphXu8ZZ6F4LLzxpC4q3oQaxen30QGfM7Y
	YPAQC1C5JYw54rrdZRbb856Db3dpGlwk1XXQ5O0k71LlV+a0KvtHonJ9KVSHJildN6rkGP5tRHn
	jeTxPflDrh/F2pV9WTye/9K5dzFKjqWRRN8G8bPFStoiRvMzHsESWGpMQlzS9/dnoFYZ3ZK3xYr
	52S/JKaeg/OmEdM7TgvPhjvayT1U+9PgvkJrjvfhnGzj1FTtnmsrk1ggE2PjsnQFsc8HsSJiVWn
	X1p2RHoo1N/fHcS9PEyeJ4KK1zuxGKVkVXsXmdZc880dbzJRA5FWPxhNXu6uoGbR6pct6VhSDKx
	kMmEBbif7CPyeCJl4v8boOeLcx8ousPMKlLNelRbcM358RD6jHfoNW+/DesUmq2C
X-Received: by 2002:a05:600c:4e46:b0:49c:fc6e:8cb4 with SMTP id 5b1f17b1804b1-49cfc6e8e51mr106151725e9.24.1788626711320;
        Sat, 05 Sep 2026 09:45:11 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75ce49esm276714495e9.1.2026.09.05.09.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 09:45:10 -0700 (PDT)
Date: Sat, 5 Sep 2026 18:45:07 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
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
Subject: Re: [PATCH v2 3/9] docs: kernel-parameters: Drop the edac_report=
 entry
Message-ID: <apxDtqM8UMN5KNjs@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
 <20260905094649.41996-4-kmehltretter@gmail.com>
 <20260905151345.GAapwxqT93wPWHF7u4@fat_crate.local>
 <apwzmSr6b0WEkW86@gmail.com>
 <20260905153336.GBapw2UFa7Sdc0ve_A@fat_crate.local>
 <871pb7zn36.fsf@trenco.lwn.net>
 <20260905162742.GCapxC_ra7hJd27LDR@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905162742.GCapxC_ra7hJd27LDR@fat_crate.local>

On Sat, Sep 05, 2026 at 09:27:42AM +0100, Borislav Petkov wrote:
> On Sat, Sep 05, 2026 at 10:20:45AM -0600, Jonathan Corbet wrote:
> > I would like to emphasize this - slow down a bit and maybe you won't
> > overwhelm the system entirely.

Got it.

> 
> I find myself telling more and more new submitters to slow down. Sounds like
> they don't read our documentation before submitting patches. Especially if the
> file is even called submitting-patches:
> 
> From: Documentation/process/submitting-patches.rst
> 
> Don't get discouraged - or impatient
> ------------------------------------
> 
> After you have submitted your change, be patient and wait.  Reviewers are
> busy people and may not get to your patch right away.
> 
> Once upon a time, patches used to disappear into the void without comment,
> but the development process works more smoothly than that now.  You should
> receive comments within a week or so; if that does not happen, make sure
> that you have sent your patches to the right place.  Wait for a minimum of
> 						     ^^^^^^^^^^^^^^^^^^^^^
> 
> one week before resubmitting or pinging reviewers - possibly longer during
> ^^^^^^^^

That's for "not getting any answers" which is not the case here.

Sending a vX update sometimes feels more urgent because you don't want other 
people to read your buggy old version. But yes, some patience is also good
there. 

Thanks,
Karl
