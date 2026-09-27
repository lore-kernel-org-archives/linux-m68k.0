Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31323B8D4F
	for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 12:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790512167; cv=none; b=rLdWHEK0KEiAh01GXzCoClQweP8PCIXylkjkgpZVqDH1Vyh+2nA3P1EFZ0BR/YAzXq7uft9gLLEluEUJNSERW6fKb84+5ePBB8PbKP7SGThYEv94dW8Nu6z/Avk5mjCy/0kqZT4lOrp3rMFU6w3DfdpnWSnoa1qJXGgs/mhtcHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790512167; c=relaxed/simple;
	bh=HDboq6EhNxHP1SC0MpV70Cq5drBQD4KcY81w33QxDHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ct3AtPmQYKQTaQSIdxspQ8NvxCb7xQ938anoPCFIkyifrSSawRwqKbH95U9iCQjcqakJRoEgjcKESsuuSOEztyCAs4uyqN8y6wcZUtOHnL8baktfWxvpr3BnIp6tOicBg9Gf0CR12fkDbWN6+jRmDT8BlxedHl7tgz8VpZi5p98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c979c5eca8so1687130e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 05:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790512164; x=1791116964;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rt/VmvtxGRMo80r5H6ofmpt3nn/BIq11DVjtj9mgh+c=;
        b=FP/1GIabp9M0r2boIK15QpjuM5hWSoB9c2fFDjD8JaC+YHfzOchZG16wGS70esABqO
         A6LAd/7oBJB05MQROOXOzBEywe+LLIGuXqV5cPEhiUEfyPG/GvAwQFInTSPgjHxr9no1
         1AbkGE2CjK7wWhyKL04zVKp0wACsy9YocXNB4JcN3pCxxPMqLpaTJLOz2wr09WPrt8EV
         0BdRANjP22tQL5jZWzoU1ATw06D3aF16nWq+1WTpHnWeMwTGLclxWFfWhauLrq4VBxCH
         oiJ3dGJl9YhPCWXOqSLbWhNwTSIgATLTjphefKEi46A8g6zZgLGq5gsh9+1aGa8g1eFE
         ZROg==
X-Forwarded-Encrypted: i=1; AKwUvBxQ/tAPwKkn4I7YI0IYcB1ITa42V+RAah/Y74x/57j6F8/UCKEPgauM3W1I5+zT4vi9jxAHmpBMk16B@lists.linux-m68k.org
X-Gm-Message-State: AFq9FYJJTrFeKJ4Ek07nvcrpexxduayj9OURq5BH3A5DviOIJZ3CMPwx
	iQfUOyl904Egg/g8Hj1zatTB+vTD8SYcC9uQGIqRdYz6WcQnvz9yPucLwTVIThDN
X-Gm-Gg: AYBFou3vL+UnuMlaG0y8o8nEKY1CavxDis6b4miCNiSwOMizfHqCvn37cn63GsSM+kx
	QL3tj2FTTH4euFPKJb7jbhiJV+sC0UIbuOQ9kBZl3QLiDD/eIa0VM3Ec9jIUcjUtk/Gk1Yr25VF
	z50bphrqGrOtYFfyVebbjzHBgmaQbiOAGJoacFkPQins4CueqX5/Idd59GffNiw4qk0Lh/Tsg2F
	X+ORUI5gzJN3X/o1o8wv10SoWBXg9er1hX4FcFjKma1tHcpfb8v2iRAHB+F+0z0L31+NXdZkj6K
	YMXAI50gMehEGB4VtmZGPNssQR8fGgLd5smwV7Xo+k9e+Mfyx45C4/PC9JhQ0TTFDJr2Jd1ONhD
	gv7+4fnJmE9lDpu4/Zj3TSnWkQK17xcIjnAj2QbWZcgHApUVtWhcubQzAeLvVwmd9l6qtniWfe2
	Ukk79Cgeb0pQJqOvFcowDdt1dtj7wgtLKHoFLZ9VxbzK7FjnzAXZqm+PnpR3Ll1ukwPnZd3Eeqc
	zGai5RQaOP9CMbE0yyaO1lDFRek/K8ulh2s
X-Received: by 2002:a05:6122:32cf:b0:5c9:a60b:e5b4 with SMTP id 71dfb90a1353d-5cb0b48ab9dmr5250191e0c.13.1790512164317;
        Sun, 27 Sep 2026 05:29:24 -0700 (PDT)
Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com. [74.125.227.38])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde02784b7sm5103948e0c.0.2026.09.27.05.29.24
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 05:29:24 -0700 (PDT)
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b2eb9b9809so1000739137.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 05:29:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy7/C/QonqeWf8gmNC1IvapOJVlj20H3HoRt7f0GI10J8xrtaS0gad2r9ApS1kspgAOd2cTKQ62V3IB@lists.linux-m68k.org
X-Received: by 2002:a05:6102:d8a:b0:7a7:19aa:8a86 with SMTP id
 ada2fe7eead31-7b38f5c21b2mr1195489137.33.1790512163780; Sun, 27 Sep 2026
 05:29:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826160911.460165-1-p.pisati@gmail.com> <20260826160911.460165-3-p.pisati@gmail.com>
 <b959b6d9-2fd1-4eeb-bc45-4968321b3ff1@kernel.org>
In-Reply-To: <b959b6d9-2fd1-4eeb-bc45-4968321b3ff1@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 27 Sep 2026 14:29:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNcDgK-3JTU_TO4V0uhQswR=yE6=pL46Z9gsP2PBnKyQ@mail.gmail.com>
X-Gm-Features: AclHuK80N3Huj581BdS3l7h66uNHbFmlTSJwMV0kOgIhzBn2ANIPVZOF_CQgtV4
Message-ID: <CAMuHMdXNcDgK-3JTU_TO4V0uhQswR=yE6=pL46Z9gsP2PBnKyQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] m68k: defconfig: enable PATA_CSWARP
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Paolo Pisati <p.pisati@gmail.com>, Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Aug 2026 at 04:45, Damien Le Moal <dlemoal@kernel.org> wrote:
> On 8/27/26 01:09, Paolo Pisati wrote:
> > Enable the new CS-Lab Warp PATA driver in the Amiga and multi defconfigs.
> >
> > Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Assisted-by: Claude_Code:claude-opus-5
> > Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
