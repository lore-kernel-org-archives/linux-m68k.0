Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7803DEAF7
	for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Apr 2026 08:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776934349; cv=pass; b=A5u8ZmMuNpz+PTeeZsU0xiS/LQPmnZZHdk7oU9qeFys3tXCkOohw3ksuLvzq5csGI0AnwrMF+MUbxhjZ46QzOC4HTO1b6dO4qZiMVlMk7GDlTWVwAFaq2KyzOp3gWiEkyAuykgD42ygYdQ56d5B5a241WegFr0WGxUi8YRIpa4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776934349; c=relaxed/simple;
	bh=QjsImxEKuQXmmT3bV+BkuZLjlWzEvsEVFzbyIuMQhG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t9EQD7N85dKN1V8cvZysuFBhZQIICcV7D3vXned2HKqGq0SYu3f3ooPW26GrZuO1CbS9Xfu/79GgdnZ8YAlYD377n4mV4SLzDITQBkMjv5j9riH/ARtrn8CC8NYRuk44YwJbBc1K0xZNYGkmT7vM0ft87K6eKLi6/M/+sFU3MOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=S5T9JN+G; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="S5T9JN+G"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12db63c6df4so3316119c88.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Apr 2026 01:52:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776934347; cv=none;
        d=google.com; s=arc-20240605;
        b=HP4/55QWZYFq3iLbEy8JZ/O83A4GAeiZrZRAWnwwOFwPRJwpwuwSyFdNoXb5UXsDWV
         k9BSq4sCHBWxCIG9xLS5L5HwxJo9/SCb9UjW12zf8/hk2XNVO1i7oXyNj2eTUEi8osd8
         GNFUfDjw91McD/jJcYeAlFsHPK0jloXOmFyLudvW/yFseUTWgZa2LagcIBeT9IE3+EWR
         fQjUiSWSKAKM6XBvcE6R7boIhJLt6ZPU987akVYjuR8eUuB6UvXCGAspFbnXGiQgcN/b
         z/maTpJEpwkR55bBJcH9/8kh7WcuStHB+/Rbtygg9PSCyEAXbjQkw+PGs3p7GUK77f4P
         bYyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QjsImxEKuQXmmT3bV+BkuZLjlWzEvsEVFzbyIuMQhG4=;
        fh=4cAXsFFoKqkfxaRHRj2xu5TA41tw3AaYA40TmIj8Obk=;
        b=d7pBFf+Qbo1ZuepUiTnt+Tv9xEnx1aDqvrepBhOwHA5e+464qcXO7Lx36h6Jk72GfO
         /tmyuJvojbhHJvGkOw3epQgxHb1Bnp9ie4cH+YIwaEzKYE1Z8NRUT7tt1X6M8qNXD3EX
         yJQkeYu5Kay1Qn3lypwKqfffUPx8p/4wJkaP6xfApBVeVaKx6+pQQ5k7dns04aKDpGa/
         EnN2lnOEkn6jCD7ghqoVVCCcLEUBYSU5RWs4AQbfeY01dfyEni0J9Ww/sUcwfbUO+XWQ
         jPMbbDLwHDSZfrP0NlBIUBVcEeiFnWerKc2+vNKiBWDVhmTbIMECefCfl5ASOVd4o7RG
         5zXQ==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1776934347; x=1777539147; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QjsImxEKuQXmmT3bV+BkuZLjlWzEvsEVFzbyIuMQhG4=;
        b=S5T9JN+Gkje5XyHN0YFKcm/caxSWnuoYNINtbT9azyAquL39sm8VPJ20UBSNcgMw1R
         IQ5rzH2t6OMLP1kmHF5EiKtp1IJTvKYQow0eHEO6D3EgGW4H8MHv7EIMgKvnyIam6EDc
         yMYFpqHTBZucAbO4wZNrZUDJ6RTzbqRx040r0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776934347; x=1777539147;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjsImxEKuQXmmT3bV+BkuZLjlWzEvsEVFzbyIuMQhG4=;
        b=KM0u3FlHNRIiTpRymGWVEvTaPBgTwcSjkYBmToJGq2EC+N9BkpiQT7XZ9VVRwbY7Z2
         RgH+kzOZ7YvD+RzcAz7ZkBDGy00MbUmI29mBcBcb3/ytIwHR5U0fPugiFvoTiYpPF/RP
         Z5mi+ilHKCN85PSThIubeGv2mEwJPVrlKlTPLnkIAOyp+9tQMce53fRRLt4VFXk5aojG
         pFqYOFZ7O4rnJ9tgqAdT7dFnBEmTEua0TeDHpFZi5PHrlaGIv9t7oH/MinZ89CMMhda8
         eIbmzCbbrlZXbBqnlCB5T0Ur/x5Cw2ZhwgS0G/up2qYxhyvgAJblfydn4Rt1dGXMmO8n
         iwUg==
X-Forwarded-Encrypted: i=1; AFNElJ+kr+2SW/kVKnJuSxjd7lxmcfug7ReJzbceh4p0cc/pgJyLm4KlY0NcVvs8g7EwQnRnmDfsbLMxN8Jb@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxoqs7Q20n6VXxSPLbCV4EXjQ7ftd4OS8jx0jC8eTVpsjH+Z6DW
	3jZExSR7KPgKiM8dspHRHLiQSNiieOc0KDVPxOZfLz6wMwp+DNv8PnsukfrH3V8WV9dsaqEQJ9/
	qcg0bB82DTN6/datX788h8dpy3ltvpXGqWvNexNO31Q==
X-Gm-Gg: AeBDies0KsysGkwPy7MA/nDLiCuC0bz+BK7bydoip7i7oFQPjipPkQnnyFQxqkHdmgj
	2BmNVFs186+luMRdfDUMRFQD4U01AXJhe67k/7SkFVNwlpPevuzH+dGU/+MAzj+YQhqvEKs4MLX
	kyAXg5yZBZsjal4hjW3wbFcLglmjMxUG+a7n/XaghSmVNZMWtEWbjp8X6sw1e6f3LkxUsQvZXAT
	4uO3x2niInD42V6919+/3Q/dNBMb1u5U1aOh4zNC1N9x9VuJu8lxiRtLxavdhHDpAtq62e/4AxD
	Zelksu6txGmgJiuCuQ==
X-Received: by 2002:a05:7022:383:b0:128:d4db:447a with SMTP id
 a92af1059eb24-12c73fa73e6mr14286081c88.29.1776934346915; Thu, 23 Apr 2026
 01:52:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422-v7-0-0-net-next-driver-removal-v1-v2-0-08a5b59784d5@lunn.ch>
 <20260422-v7-0-0-net-next-driver-removal-v1-v2-10-08a5b59784d5@lunn.ch>
 <CAMuHMdV-vF6sTvAi8kKzxGwZ9YUSBO1Qta5PDCRbA0zr-LEp_w@mail.gmail.com> <c0c80113af470b265650405fa24deefe2d82ea24.camel@physik.fu-berlin.de>
In-Reply-To: <c0c80113af470b265650405fa24deefe2d82ea24.camel@physik.fu-berlin.de>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 23 Apr 2026 17:52:15 +0900
X-Gm-Features: AQROBzCE5_am-yGAVd6HVGlMuKn48vLDnCtCy6OhnZNL7yJIJYBvslDU1PnlxZI
Message-ID: <CAFr9PXnECog56b+Jq9TBohhQ4oBB3hGV1pHj6OstOSLqkOpcTQ@mail.gmail.com>
Subject: Re: [PATCH net v2 10/15] drivers: net: cirrus: mac89x0: Remove this driver
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Lunn <andrew@lunn.ch>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Michael Fritscher <michael@fritscher.net>, 
	Byron Stanoszek <gandalf@winds.org>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Thu, 23 Apr 2026 at 16:10, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> > Macs do run modern kernels.
>
> Retrocomputing still is not well regarded by some maintainers, it seems :-(.

I've found bugs in drivers by plugging those things into exotic
hardware like my Amiga 4000 and Ultra5 [0].
So, it's not totally pointless. And having a shader capable Amiga[1]
is pretty cool.
Sad to see fun stuff getting pushed out by basically spam bots. :(

0 - https://lists.freedesktop.org/archives/amd-gfx/2025-October/132283.html
1 - https://gist.github.com/fifteenhex/0e5ce8c1614bcec20ed242045c11d1d9
