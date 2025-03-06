Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86932147FD
	for <linux-m68k@lists.linux-m68k.org>; Thu,  6 Mar 2025 17:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741283091; cv=none; b=TnNK3/TnNhF8A9JaTeJ96SZhEk5dg3pS4YJGYKqpFmhsEod9sNi2vfmhSdzhb4KINLcO/X6pBn+go7LIgI7KYTDYJYyDNffRB4XF1JJKiT41bhPhhXaK02hUrrrqnc83e3zpW1N3zk6SLxJ606B9I+I/52voaYvw2zW3zOpoMHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741283091; c=relaxed/simple;
	bh=QJmXhhJ268S5pczIrEFQ2Jqo3REkMiMrSCn11pdmkFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c166sgXkEnZUvif4aZaYeL0FgAw+bzprYm+ceMNQQFoGoGb3kRqiHgHSW2uTpjJm+sQxiaXUVz681thLzdUCvs+J8BIiopufJI1j6UidokZz2B2/Q2PinQIJq1DyxGFyP4gi//Gt7J6qF7YL0dOBSFKaVehiTjVgniHhDTSKSCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-523a6fbf025so393517e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 06 Mar 2025 09:44:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741283087; x=1741887887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6UG0BoDjq+wII57XehpuikrAnqg7CYhLzQIRn+82n4=;
        b=j+VqAd7elbgbKtnjQQZMFQ5d+wajT814xTMXcWM+bYZB/u3FFlOFn+PdFOLd/gaEYP
         Q4xouEKukgXaijiiuV8hld3HI7CH5vZrt6VCkIIc8YsbiRFpvRe+op8Sl9l4oKP26WjE
         bq6nH1dxeuYnlzAqlluclg1fow/jwV3Iq08PagiMesPxQV2C52BGKp+jnm9msR+Etbnj
         kJ2nHM+Jbvp1Bp052bK5zJNBfZ0SiV7Xikk/JerZJFAgMb05CsBxAA5/19woaCaUWzni
         1mefFVFF6jWIfemlOwNE9rdJ1HUuEQIGyJGoSFlMxBff/bV33bga9u9S3YBaEB71IrA1
         sL6g==
X-Forwarded-Encrypted: i=1; AJvYcCVgJHHU9iyfD1N0piVZA5bKW2Kz5W86liYzMoAr1QcKRGw0rTVeteOk2FbLqMXHPAkoCKf1SAPLQpns@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxDtSMgzbNFat0QO5iuRpSgTYxijWu5fpQUJVQmPv2uWfenINxR
	ZSmJpDQppxCscMkxDqUpde1yzh4IrDTAJyctoWoAgp9/FXXVOyoJoN6pfxw2jpY=
X-Gm-Gg: ASbGncvIxUImCp+WHEWySxJY2QfctQ0qt5PbGqzBTXTkU63OMprnB5UAExMdkQ8Mnmg
	M1xNmbHM3VAuoa5d8vnsFcQ9v2+sNKUuZlXvAzzfiE+Zns4uOow7/FEmCvmswIUehalGkn6H/gt
	Ys70fMYdS2U5mFq0WS8XXa28B2xPVA1r75nnDdkGUYZLHCozCi69WIgbxEJvqLRZLM7+6+TsjAM
	IXnPSxRWjxT5KR7OktUjlhGfD3mjBqlojXK+EM1JQB//q5TpTbaul1EsbcJJi1Hidi2OaQQJXVN
	+1QDvmF0XrcUuc/Mq39CqhA4ont6LnsZp+7ecy8fIp7y1d57SOpTMGQdQkuJJAWb4hyCiZwB4qA
	k8UkZqTM=
X-Google-Smtp-Source: AGHT+IGPp2MeSBp8iluygs3Ouff0IkaP1HBRGsFjCpFOJy5+DAByCxmJA3WRcgGvSkyK3e5XMRHkjw==
X-Received: by 2002:a05:6122:1696:b0:520:af9c:c058 with SMTP id 71dfb90a1353d-523e414a6bcmr652124e0c.5.1741283087283;
        Thu, 06 Mar 2025 09:44:47 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-523d8c83664sm238895e0c.37.2025.03.06.09.44.46
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 09:44:46 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86c29c0acdfso410389241.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 06 Mar 2025 09:44:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXpHUV31R08FstKMhwfS12cSGHg6GE/FT1lHIC8TqZ/AspseTqqN/jHYv5l+PI3+CFleV9qjZTtzVBg@lists.linux-m68k.org
X-Received: by 2002:a05:6102:38c7:b0:4c1:a448:ac7d with SMTP id
 ada2fe7eead31-4c2e27b3179mr5846045137.10.1741283086657; Thu, 06 Mar 2025
 09:44:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302230532.245884-2-thorsten.blum@linux.dev>
In-Reply-To: <20250302230532.245884-2-thorsten.blum@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Mar 2025 18:44:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUonC54g-XSt-EkNbEGxhkOWMxBc87Qtw0MyeXoPqDD4A@mail.gmail.com>
X-Gm-Features: AQ5f1Jq7R80tfvK5LT7usBpSLmMBfHezUmZK5I3xKCRPWw4P2MZ3-jt2tl-G-PQ
Message-ID: <CAMuHMdUonC54g-XSt-EkNbEGxhkOWMxBc87Qtw0MyeXoPqDD4A@mail.gmail.com>
Subject: Re: [PATCH] m68k: mm: Remove size argument when calling strscpy()
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Mar 2025 at 00:07, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> The size parameter of strscpy() is optional and specifying the size of
> the destination buffer is unnecessary. Remove it to simplify the code.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
