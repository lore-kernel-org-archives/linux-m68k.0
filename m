Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BE0139D0E
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Jun 2024 07:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718696376; cv=none; b=ItzDyS94Caz2ZsKgrdTuyP+7sDzxzhiautVJqPvrVVN8k550JI+n9P79g8nOWaqhuHfchFl1CLHDWMG3KcAbMVwYdime0bQPzHEv++t3I/rwslFd0aYYeN74Vs/6X/XldZZyzX02LSNbi9aCUNFNIfTz7fFsMQaS8M+17KZaPBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718696376; c=relaxed/simple;
	bh=iFj1EOLNRi8OEe3awn9Vs/G2Qc1FpXOws35aK5rTw9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qFEDrzPYKXd9VpzO6Hxvk/gBD7K7Og28uxDMmbSL5Fb5KQ9l5v+ey5yShtNzVz7aZwhkZbBB/GNOy4YTO09rCd//9cQ/uy3zvUlZW+T8AsJT76r6S35xSHqXZFPCloj8CKEA7MAUbxexzl/CNQDmjLBTKnJMomSB1wVntYWa0ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e02b605bca2so106175276.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Jun 2024 00:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718696373; x=1719301173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TC99j/wOMG6xkn/KBJaP1XjEqr4S+ZxXwwULNYN4qNM=;
        b=CA8U17vQNR1Cw93TZn3/1mVePqTGZUu/sJxSqwg3Q0ZifEcxp08NH9k7uW6UjUOPOU
         j2emrl9dqFvGo3DcpNNLOgzwP4+6vVbbq3bhjK7iwy95nbBaRr3Jpy701iGcMPfHIGZo
         h7stugi/LmE8Apok0ydBMgfh9kb6tLwG8HbNFFeDFOP2RufwDpswe1kojn+kd/BWZO7L
         zxoRfkMuE6XhPMdqGo4xVKgPwoyVspLjyJ+B/HLiJMOUpJm31nO2PLtuk0KH/+1vvto+
         eq1mMyKe/DoYJAPyxg/2irwzXy6TvrMYobYuM4rs+V5ExbwJV25justZ9sQuad7eOsYI
         YqJA==
X-Gm-Message-State: AOJu0YwrQ4VQ5NK+m5+dNf/VF7EDLrDlhs9VTlkv7Ob9sXsmD69bMZvB
	3UP1KTxFen/DQwj50K3VtVMarHMO+Tg4MWYaavjOUyHobZdMJlL77VWHbkpb
X-Google-Smtp-Source: AGHT+IFCy/FxNsMJt3QxWH/mGvLNMANjd4Dh5LBZjOLlsclBKL01Xv/+Vt8ytPVy3oG02tEL9h83zA==
X-Received: by 2002:a05:6902:521:b0:dff:1dcc:7139 with SMTP id 3f1490d57ef6-e02227591b7mr1209902276.11.1718696373072;
        Tue, 18 Jun 2024 00:39:33 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dff048c11d3sm2217860276.36.2024.06.18.00.39.32
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 00:39:32 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-63036fa87dbso38447737b3.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Jun 2024 00:39:32 -0700 (PDT)
X-Received: by 2002:a81:e30d:0:b0:61b:e61e:8988 with SMTP id
 00721157ae682-63949fecfc4mr12300737b3.18.1718696372575; Tue, 18 Jun 2024
 00:39:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618073205.65303-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20240618073205.65303-1-jiapeng.chong@linux.alibaba.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jun 2024 09:39:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJ9e=HTgZA=4A_7kG4y4sDVCz4ooYHrhGHweR473ME8w@mail.gmail.com>
Message-ID: <CAMuHMdVJ9e=HTgZA=4A_7kG4y4sDVCz4ooYHrhGHweR473ME8w@mail.gmail.com>
Subject: Re: [PATCH] zorro: Use str_plural() in amiga_zorro_probe()
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	Abaci Robot <abaci@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 9:32=E2=80=AFAM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
> Use existing str_plural() function rather than duplicating its
> implementation.
>
> ./drivers/zorro/zorro.c:155:22-39: opportunity for str_plural(zorro_num_a=
utocon).
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D9350
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.11.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
