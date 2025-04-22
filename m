Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7925431A89
	for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Apr 2025 06:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745304822; cv=none; b=oLsRpiTPymqpet3Y1tC729e0XuvWktuangnu+ME+81cCpd1gaZi2nPUx4hUz9vi1W73PYnyH4LIPsB1W8Em/qYjdJp3CXySNBBcCsBlMzkhhaPQFB/oFGFVux4UT18UeNlE45J2HZiQB1kKyINU8YIEGCr51yk6/L6gaaibStaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745304822; c=relaxed/simple;
	bh=o+0Z7E9dHOtAqc9qeekTgsXyjthDM1KZi5yYL8WGZCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KWe5xo/UuzU7UuJS955kq8KRXGuCn1i/n8iJhPAHIUJiMnG7yMmvqt2MEPBSr9eKn6YlOUZNiumjOudoVhGSvumzOtX7QK4mE7qtJRFPbB2ajGTmdWHhPUxxZ/nJ2E9fulOP3Fu+6ySwT+nxVdNdFavMrVs8D/Dr8/cCznWbef4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-523dc190f95so2029912e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Apr 2025 23:53:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745304818; x=1745909618;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rFPKb6CP/9D7XzfTcXS1DtzW+fjOJEq+OhtUCqD2Dk=;
        b=ZKbQyGKdPsbA2XgJHBt+A6wqkkp3+58hoGuCM6q4Bu/nu2PeZyQ6T/4Lvuopssuk9P
         wYJwZtzvjL+aOEyVmocOf2nCM+cwMU95ouMAiG7s9t0pFBhPbxAuHRUaoovbSrHGkmi5
         0hbkGq3Qp3U9zbXUtTEfnk5Tkuo0NbjQbHcy2j4FfP0oDzk8F/WaK8/xbFCxJyi61803
         76OTdE4MkTwktcl2QZk8RVY0gk1NDbs9XOUQvSpQNKAlGnxD9I30th5y97pDNPU47JJP
         Djx1jbcz1wMWpc/hNaIbdJPbcu+kLLapncnPwvrAOzpTkn9/LfCU141oufZjmdKFnajN
         e/Eg==
X-Gm-Message-State: AOJu0Yz5S9lmVh+SQO6ytkD3RjN2KU8iOdat/11MD4psFnK2wRSia0p9
	fBEnj4cKG3mR1zq4V42b+a81DNsnEFj6kt9UKSOgdJ8YQm0dsxVhPWs4rjq/
X-Gm-Gg: ASbGnct9RgqldzC02TLm/sUkDlBJtYYlfY485QSvhv+vy4O6l0bkEOnP1SYL17XXx/B
	Ws88M1K26DtotNQCyK2sIO9rcqu1gYOogtmvitzDHXapOE5eYdMU5oZ3IUQISGDQnCNkY+zbE6J
	P5dNZD66CXoJRG0DGi9vNz3LNDTMbH+q4aSVmX4n4e3M9jsZ1RXfVWjLLZ63NNe9zcdKtrfVAsu
	gUu7ANkAoAl7JgANBYQCPVQPXGFJZxFGGTKjuAzElUAF/MzFTTUhZciMxGUxMwAL5hVVfs6vXWn
	NECd2IHNWA5ffbEY1Z/A2CTBauLnW6hVGkQKLHBdzHa6SoWqhUMwU3LYQ1QqVstJXkqkV9UxNby
	7APleXU0FlYw7fQrLVQ==
X-Google-Smtp-Source: AGHT+IEkkyxe6kF0ltjCKrBxsBAXjuVwYs3InMZdX/rHjhv/wXOaxSwjPKEEU1iJpN0Um6zhaiAQsA==
X-Received: by 2002:a05:6122:45a2:b0:523:6c0c:e991 with SMTP id 71dfb90a1353d-529253d6884mr11371219e0c.3.1745304817902;
        Mon, 21 Apr 2025 23:53:37 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87764651923sm2188840241.3.2025.04.21.23.53.37
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 23:53:37 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5259327a937so1687981e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Apr 2025 23:53:37 -0700 (PDT)
X-Received: by 2002:a05:6122:469c:b0:525:9440:243c with SMTP id
 71dfb90a1353d-5292551a428mr10455386e0c.11.1745304817283; Mon, 21 Apr 2025
 23:53:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417201013.46384-1-shankari.ak0208@gmail.com>
In-Reply-To: <20250417201013.46384-1-shankari.ak0208@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Apr 2025 08:53:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU9w8dc5T=0B7mECJhrK6ARUiGjJ3EG=0-BR9gbJm-XPA@mail.gmail.com>
X-Gm-Features: ATxdqUF5qXPqEzaS67FvA0Xyl2hoFP1gV1DVpdwII0KDttQQr6uxlhNup-JIW0o
Message-ID: <CAMuHMdU9w8dc5T=0B7mECJhrK6ARUiGjJ3EG=0-BR9gbJm-XPA@mail.gmail.com>
Subject: Re: [PATCH] m68k: replace deprecated strncpy with strscpy
To: Shankari02 <shankari.ak0208@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, jeanmichel.hautbois@yoseli.org
Content-Type: text/plain; charset="UTF-8"

Hi Shankari,

On Thu, 17 Apr 2025 at 22:10, Shankari02 <shankari.ak0208@gmail.com> wrote:
> The use of strncpy() does not guarantee NUL-termination and is deprecated
> in the Linux kernel. This code manually terminates the buffer afterward,
> but using strscpy() is simpler and safer.
>
> This change replaces the strncpy() + NUL termination pattern with strscpy().
>
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>

Thanks for your patch!

> --- a/arch/m68k/kernel/setup_mm.c
> +++ b/arch/m68k/kernel/setup_mm.c
> @@ -243,8 +243,7 @@ void __init setup_arch(char **cmdline_p)
>         setup_initial_init_mm((void *)PAGE_OFFSET, _etext, _edata, _end);
>
>  #if defined(CONFIG_BOOTPARAM)
> -       strncpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
> -       m68k_command_line[CL_SIZE - 1] = 0;
> +       strscpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
>  #endif /* CONFIG_BOOTPARAM */
>         process_uboot_commandline(&m68k_command_line[0], CL_SIZE);
>         *cmdline_p = m68k_command_line;

The same change was already applied as commit a7130910b80753d5 ("m68k:
mm: Replace deprecated strncpy() with strscpy()") in v6.15-rc1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
