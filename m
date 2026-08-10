Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5207E3AFD08
	for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Aug 2026 09:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786354213; cv=none; b=FV5O/c6R/VtS7JaqAtI7vYvf+BDccAoajgoCWVDSGb+9cEpuZLG7E9zTZZSJY14ySRbgPXv/bltoun4bfQbUjrlw5q/b9olucCfkbMjKw4F8bI+YNt24tyb8ZGjODs9F/MKQAEpd/aQAQq97N9ymL6N9f+BOWdA+j26NJCIPjzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786354213; c=relaxed/simple;
	bh=yzK9eqeqHRkkqsX9vLJsn5ZD05Ikx0+9dfcHrM485oU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QBDp8n3zgzgIDEUuPtedJ89Ua9yI1Avxf2+v+zkxKDzdwyIURzt2QR8FLdnGd74ogxXEYfa79e4ToolqFaim//giSHiQCbniHVU40wAx8svMWuaWbY8sKMkAfr/6n1GBSwKNRhtbK/eiLYkYS4TS1qke5U71ijU65EFQsrkNYeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c2c0df0b45so491599e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Aug 2026 02:30:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786354210; x=1786959010;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1Q3olUszZHPHSfKycoK9HWlmYEYUmdKW7ddfv+lMVws=;
        b=EW+yAf1MZVO0VZ5YUkBfoQtYoRfrPe6B09kfJbAHvNg0q4wmSqW7+le+44jHnQN7Vc
         4A06jIjI1LQufby32WeWzz3QutmNLuSaO0yEYK9zoj8kOI7QagO/pJzIsgWvR1aEYLCV
         kqsE6DqveTxqh9HXeiNyJL0172O54JPOEhCWfQoW1g8O2jmujgQoddrIbjY8EgeaTpFQ
         Cf3ehJVgJ2ghw0/yz+k29+bC+Vf+VnDJlByPPDPcJjb+qcZ0A03M6IjeJQk/V9wHIfgP
         CQAkyN3B4dwu6HSJkJuWengXk1sMxTDK1FdHkxC539p8h6VK+Jv4v9LHKZXRk12yL+0P
         pa4g==
X-Forwarded-Encrypted: i=1; AHgh+RpttMfwumDkqhuPsJWAQyOU1ahflq0ZbzcXInNfMuvXckGC5g8JOpcG3ow3NN1iWX6TUbKRYaSHT1Ty@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzL98ybHz5/M2p+sSByzhi7QFZzgV4GemZesnxzn2osfon9IIbW
	0k7Z/GIEA5FR0MBsecB0HHytRZ/rp8YA2IrdA7JtdlOq37tg5vsgnTbPTpA1FeT5
X-Gm-Gg: AR+sD12aSNRSs0I/G1BKqCUzgbi9NWxVftzTn1UQhk00WJ3GZZtkyJMJFwzASNtIiRH
	9CXlSMl/4R7mHv5MoRVkNouQwe7FSnUYXkXREvQfSxinGTQ9IsvecgAQcH9Lg2N3cBp3u1Owa1I
	1ngQUQGv2M1tpFCnisGOcbpMwL5zRYJXQFB/kK8KCNokBju14gRuJsoclxpYV8hrsKjqL3FWdHO
	xYUhsFUiThDjgIUOTDgwVLkcgvCPg9BmAfQ3yoKois9fHlUKuLpAPJdsETAIYhFCksFMJT2FI+y
	9kTL06FZKJ3prQhm+Ymt9j32K726jqhBO1fXMbKeaYDuKspD4Fm3AEfWmdNUqdfbfx8eLzIRFNF
	e26dzj/N5ey71Yq7BpRlV9Odd6l72EkUvQJluJ9touOYbcLM9v0Bzg7c+q/7MpZz3C1jTHJuck2
	8ajK6nGGxEjcoRo3t7ujrq/aa1li47EOnpqoC2Kjuz/YeAN2SGaunfzYXt2ZD8DivnoOGzgpZ/+
	SMPSB2/0j6554zsiuugiNN7wBSiiA==
X-Received: by 2002:a05:6122:1d93:b0:5c1:1965:6243 with SMTP id 71dfb90a1353d-5c3d9272795mr4169031e0c.13.1786354209931;
        Mon, 10 Aug 2026 02:30:09 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40ae6a78esm3980703e0c.4.2026.08.10.02.30.09
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 02:30:09 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bfaa014978so629353e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Aug 2026 02:30:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp0211dxFasCWCNvDmjvyDd+ENxStrCEQD8loPAFRbWUxWMrRYafFnxPD9xFrrziwYihG/l1kDzh2VX@lists.linux-m68k.org
X-Received: by 2002:a05:6102:f84:b0:73a:128b:ea07 with SMTP id
 ada2fe7eead31-760e8f3a718mr9755418137.14.1786354209457; Mon, 10 Aug 2026
 02:30:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629120426.680032-4-thorsten.blum@linux.dev>
In-Reply-To: <20260629120426.680032-4-thorsten.blum@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 11:29:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV853eQggc4kxsqhJZo0AyAMmOBKEFD8AmTYsx-p6kUSw@mail.gmail.com>
X-Gm-Features: AUfX_mwKTXBa909rqrY--imLkxMvJJAMbaygjwcoDOc8Hgoc_M8DyPR1iT18cv8
Message-ID: <CAMuHMdV853eQggc4kxsqhJZo0AyAMmOBKEFD8AmTYsx-p6kUSw@mail.gmail.com>
Subject: Re: [PATCH v3] m68k: amiga: remove redundant amiga_reset prototype
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Daniel Palmer <daniel@thingy.jp>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jun 2026 at 14:05, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> Remove the redundant amiga_reset() prototype and mark the first one as
> __noreturn instead.
>
> Tested-by: Daniel Palmer <daniel@thingy.jp>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Changes in v3:
> - Fix patch description and drop __noreturn from the definition (Geert)

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
