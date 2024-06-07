Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A381847
	for <linux-m68k@lists.linux-m68k.org>; Fri,  7 Jun 2024 06:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717743456; cv=none; b=Rn9pzbVwcp3h13tELtNakbfojGPI7TbAY0H5X7AwQSL07dZqYwhRXRn4ND60ypBG/4ivghAwWfGJql/U0zDLmsNKbYaMLJgQAxjQQjXLn+7HPSSG6FaxRab9lH8EX/kQCFz6gpkXbSptZwR3jD90YPlXehZ4vgMQ7CTng4G+PMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717743456; c=relaxed/simple;
	bh=/NsV1xCpsc3suUKRsZxmMVdrfyTuRoYhqgu2XIv4Zzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DhO/4NgI+XbjjliHF6XTC1vb5ZCveB8csW7LylSLIwpPgysWvph1KsfYGODnOcDFHW0FLUTOXN9vRs7k3QPJtwhhinNXoqQpANBCfW56YhH4age85nG18e7qOy8S17Yyxg/jtOJ98L4jyWImPcnYa0UeZrhPOA9/uJMs3yPW2Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-62a0849f8e5so18436877b3.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 06 Jun 2024 23:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717743453; x=1718348253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Qtdb1RGpi6pbdda8pk0xnyq77C6wfOfzayfZvYin84=;
        b=EhYv8XstskIGHTzHEm83ZiMstkeUevsdqRbRAwmnsvHLwSp03Slw5En5WTX4Qh0jPN
         anJpuyZEHIpq9HFosGe+KBgKNqBiZftnrWwjHAfe1/uMtRwt3uFJzb1VGhCWeGwyv3oL
         db9QlID87/dHW6mdeGZRZi9y5BdkRo2h4O/EpIT7hPddstJCYCsy3xe+DSnsMET04UVR
         qUT3mQxuIHXlwSJTgpxz9KAaayA7JWrptu+UnS8f+5F7WPuTs7z5KPL5+0NGyZCdcCM+
         tSPLDbVv0y6W9fQs7ETQgRf9m7bcNMHbWXar2bUc66gfnNvqy834SxAxk1wHzqDENLTZ
         ymAA==
X-Gm-Message-State: AOJu0YySv62WMN+ca2V/bfrg+RKQ7DBfOoG9Ltdb8daS7VNqX9aJsvux
	Sgw+q3fKbuydnFp1P9sofuNoISYEz1M34B+M+V/9BVW5SWfYr+xjy5l6DSnh
X-Google-Smtp-Source: AGHT+IEo/YbytiJZjfEC6EWwR1Wcu/HjLgbD49JjjddWC9+fJr0MFk9e0YOsRwGILzTsCLd66031gw==
X-Received: by 2002:a0d:cb01:0:b0:618:8900:8105 with SMTP id 00721157ae682-62cd545f906mr15969137b3.0.1717743452647;
        Thu, 06 Jun 2024 23:57:32 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62ccaeef7dasm5699487b3.137.2024.06.06.23.57.32
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 23:57:32 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dfafe87b5fbso264919276.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 06 Jun 2024 23:57:32 -0700 (PDT)
X-Received: by 2002:a25:ade4:0:b0:df4:e088:d012 with SMTP id
 3f1490d57ef6-dfaf663b227mr1678782276.17.1717743452256; Thu, 06 Jun 2024
 23:57:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <68ec857f-a559-4f71-87ba-425b4ee7c9c7@yoseli.org>
 <d18dab84-f6d8-4732-88cb-8b95bd4487f3@gmail.com> <45745b6a-341c-4f9c-8787-6154393d1223@yoseli.org>
 <82ba7ea3-d290-494c-b3e3-93d9dc7c6c0d@yoseli.org>
In-Reply-To: <82ba7ea3-d290-494c-b3e3-93d9dc7c6c0d@yoseli.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Jun 2024 08:57:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV7Tjs86UoyDBsj44dwPwXdRb_gPEH2jFmWA_PLP+-B9A@mail.gmail.com>
Message-ID: <CAMuHMdV7Tjs86UoyDBsj44dwPwXdRb_gPEH2jFmWA_PLP+-B9A@mail.gmail.com>
Subject: Re: m54418: ELF execution issues
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: linux-m68k@lists.linux-m68k.org, Michael Schmitz <schmitzmic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jean-Michel,

On Mon, Jun 3, 2024 at 12:54=E2=80=AFPM Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> I managed to get really far in my boot process, as I can now try to
> execute bash. I had to change the elf.h file because if I don't do that,
> it is not working.
>
> Here is the diff (on v6.9.1):
> diff --git a/arch/m68k/include/asm/elf.h b/arch/m68k/include/asm/elf.h
> index 2def06a99b08..38acb928fa81 100644
> --- a/arch/m68k/include/asm/elf.h
> +++ b/arch/m68k/include/asm/elf.h
> @@ -78,8 +78,10 @@ typedef struct user_m68kfp_struct elf_fpregset_t;
>      the loader.  We need to make sure that it is out of the way of the
> program
>      that it will "exec", and that there is sufficient room for the brk. =
 */
>
> -#ifndef CONFIG_SUN3
> +#if !defined(CONFIG_SUN3) && !defined(CONFIG_COLDFIRE)
>   #define ELF_ET_DYN_BASE         0xD0000000UL
> +#elif defined(CONFIG_COLDFIRE)
> +#define ELF_ET_DYN_BASE                (TASK_UNMAPPED_BASE + 0x10000000)
>   #else
>   #define ELF_ET_DYN_BASE         0x0D800000UL
>   #endif

If you end up needing to make a change here, please reshuffle the logic,
so it becomes more streamlined:

    #ifdef CONFIG_COLDFIRE
    ...
    #elif defined(CONFIG_SUN3)
    ...
    #else
    ...
    #endif

Thanks!

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
