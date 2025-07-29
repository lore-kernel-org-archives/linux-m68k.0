Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EC728FA8A
	for <linux-m68k@lists.linux-m68k.org>; Tue, 29 Jul 2025 12:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753791055; cv=none; b=YmDrgkIcWvR9Bgj2zBVauhCY0KIQLPz6zEYjKRxBhgkmoSL8vRYGxXQNTv45TDln3WU2T11UqtLqMMq8pm3YLKPHj3yx7goaB5Kb6kQUb7ZP1FpcTewotcAlGG80UwHLdFVnBR/RU0dtoMT7zSOWlEkFeBw1UWhRQgFYvYHkOZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753791055; c=relaxed/simple;
	bh=rKtzWVWUY7dD8BuStxPm+F6cs4Vj27MWSvAaSW3jZwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tRxbQ3V/oxhaIFxywiBAYJ66M0kFHpTG3L4J8ULingkY5XwvgJWxSZZcy1iuyeCsutv2841h7quh6QnC1DX3dUcMbeXM52F+0OL9MgtJ2K7SJ6+7jWlZMTIVrWdz5iwmHns4BGc+nG6n8XPnSXtf3wa4V6QojqawjkqfOpg+toA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYqm7YdF; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYqm7YdF"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b31f0ef5f7aso2956249a12.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 29 Jul 2025 05:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753791053; x=1754395853; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LWKHnk9oQgxyxeUhSbQJnOtQ7QzoSPEp1bSLbS6/MPA=;
        b=bYqm7YdFlIVGr9J/QwZhm6tYD2K6bszX0rYRBXMpaEle06XTzpinHpPovmAtKbb0e9
         x6n8/JteY7zHVHcSynOAaHlNOJcsUhygrk94c4kscA11gPBCJ9RczuPHQLV1y69a7wvT
         QLTGLH3c6WX6G65YnSCeALWPLxOFxIvuZncfCIvJVJqujXQLgKXTwNnJV9dPR64sG84p
         MBeZw8FrlShAuDbIhe3C117j6IBm+jQNa4F6CvrXGXrLGcuazcs5jhSTi77jSDaFQqHh
         yh8NLvJ7T+rB8OJ21i6xxEwCH26mNzr7LQf2mKw6VDKUUJfa45z/nrRHJdzCDLEJNKs4
         hLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753791053; x=1754395853;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LWKHnk9oQgxyxeUhSbQJnOtQ7QzoSPEp1bSLbS6/MPA=;
        b=XzjeQjXCNxIE3mYx9roLD6twKLqIwFTfLLmf5hN/4uJsSAuALdOCPeRGFDjDwaglWP
         t2SC3dH9+TS/jeNVQzeuFcB9ttO5caFpC3d+qtwRWyfUAiMwiww+nnEvq4600yi67hxc
         KxgKCvVmFhg5R4HuH1DWZMao2ka352q8XrHJG7ZGXcUk2KzXNqsuBKhxknjLr26KE1vY
         KucnuOPFwnJoVZo1kWglhp0nPS2xY5lmgIJVT2Vz2imM2Xh38hH41gZ1aDqyW8pprR0v
         dgdtfaRhvsQi4DmXnG4i4Vmkpn6953gmKmHs7ZGSdDlXAQlnxSPbREc16pG8/CgJdLqe
         ZPDQ==
X-Gm-Message-State: AOJu0YzNLIGeM2TLXWOdKnh772i8v/KmPLKnJALrCiUeGJMP8VMNvhNh
	oM32FQ71rAxitRiIb6Hp2lML/829AHrc0/T6BlWIURpZ0uvYpttrTRy8VnOnaNjzt+uHlIv5w1X
	Ym7JRhyuqj3roZsHe0cKzufylUalxhy8=
X-Gm-Gg: ASbGncv7YoCbV3e3UE+WeVaPJUCxv0Z50Uvu9ViwTCqt52vIP17YazeRkK1/BegfaA6
	50SvrtKtb/hREbRp2CB2biVP6J7rvHt8sdAHlplOPkqRM76KK6GaK33RSP5B/5ATZGKM5ajyM1l
	8fiQNohNBWJmrbuDn15AiObcgigKigatulCjdgPhiepisESGo5jWe5vljzh0NqXNJ1B0eVH+KEl
	9iXZ8/NaG3pLYDhsvS0cxIYg+273hkoZ862by+PvCT8GxiUZw==
X-Google-Smtp-Source: AGHT+IFaP60gv1WUSZkMysTKs9jLnxKeTR2W/y+JRoZNqD/JP+7TPLQUx8CAkQV9vGmvxYf/KQ5ZXmqN2rQlrRfTMAM=
X-Received: by 2002:a17:902:e84d:b0:240:5549:7094 with SMTP id
 d9443c01a7336-240554973c7mr59545695ad.18.1753791053170; Tue, 29 Jul 2025
 05:10:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728093412.48065-1-jogidishank503@gmail.com> <CAMuHMdUkJrsug-hKkM_f+0xxrPHBQfw_3WB2FhMM=yAYzRn1Eg@mail.gmail.com>
In-Reply-To: <CAMuHMdUkJrsug-hKkM_f+0xxrPHBQfw_3WB2FhMM=yAYzRn1Eg@mail.gmail.com>
From: Jogi Dishank <jogidishank503@gmail.com>
Date: Tue, 29 Jul 2025 17:40:42 +0530
X-Gm-Features: Ac12FXzLDB0RTpdarzYfGQJBL9ZYIFpDrCdATt7059pgrTe3rFIgWZd2ZC7dBH4
Message-ID: <CADorM-9OnP2zbtn6FHp-3NcO8nfnwC_RbzdcHdiUJCPXyMy8ig@mail.gmail.com>
Subject: Re: [PATCH] zorro: fix checkpatch error by avoiding assignment in if-statement.
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	darshanrathod475@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Thank you for the suggestion.

Additionally, the conditional logic is inverted to reduce indentation
and improve readability, aligning with kernel coding style.

Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Dishank Jogi <jogidishank503@gmail.com>
---
 drivers/zorro/gen-devlist.c | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/zorro/gen-devlist.c b/drivers/zorro/gen-devlist.c
index e325c5ce995b..853619ab27df 100644
--- a/drivers/zorro/gen-devlist.c
+++ b/drivers/zorro/gen-devlist.c
@@ -44,31 +44,32 @@ main(void)

        while (fgets(line, sizeof(line)-1, stdin)) {
                lino++;
-               if ((c = strchr(line, '\n')))
+               c = strchr(line, '\n');
+               if (c)
                        *c = 0;
                if (!line[0] || line[0] == '#')
                        continue;
                if (line[0] == '\t') {
                        switch (mode) {
                        case 1:
-                               if (strlen(line) > 5 && line[5] == ' ') {
-                                       c = line + 5;
-                                       while (*c == ' ')
-                                               *c++ = 0;
+                               if (strlen(line) <= 5 || line[5] != ' ')
+                                       goto err;
+                               c = line + 5;
+                               while (*c == ' ')
+                                       *c++ = 0;
+                               if (manuf_len + strlen(c) + 1 > MAX_NAME_SIZE) {
+                                       /* Too long, try cutting off
long description */
+                                       bra = strchr(c, '[');
+                                       if (bra && bra > c && bra[-1] == ' ')
+                                               bra[-1] = 0;
                                        if (manuf_len + strlen(c) + 1
> MAX_NAME_SIZE) {
-                                               /* Too long, try
cutting off long description */
-                                               bra = strchr(c, '[');
-                                               if (bra && bra > c &&
bra[-1] == ' ')
-                                                       bra[-1] = 0;
-                                               if (manuf_len +
strlen(c) + 1 > MAX_NAME_SIZE) {
-
fprintf(stderr, "Line %d: Product name too long\n", lino);
-                                                       return 1;
-                                               }
+                                               fprintf(stderr, "Line
%d: Product name too long\n", lino);
+                                               return 1;
                                        }
-                                       fprintf(devf,
"\tPRODUCT(%s,%s,\"", manuf, line+1);
-                                       pq(devf, c);
-                                       fputs("\")\n", devf);
-                               } else goto err;
+                               }
+                               fprintf(devf, "\tPRODUCT(%s,%s,\"",
manuf, line+1);
+                               pq(devf, c);
+                               fputs("\")\n", devf);
                                break;
                        default:
                                goto err;

On Tue, 29 Jul 2025 at 12:38, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Dishank,
>
> On Mon, 28 Jul 2025 at 11:34, Dishank Jogi <jogidishank503@gmail.com> wrote:
> > These changes improve code readability and bring the file
> > in line with the Linux kernel coding style.
> >
> > No functional changes.
> >
> > Signed-off-by: Dishank Jogi <jogidishank503@gmail.com>
>
> Thanks for your patch!
>
> > --- a/drivers/zorro/gen-devlist.c
> > +++ b/drivers/zorro/gen-devlist.c
> > @@ -44,7 +44,8 @@ main(void)
> >
> >         while (fgets(line, sizeof(line)-1, stdin)) {
> >                 lino++;
> > -               if ((c = strchr(line, '\n')))
> > +               c = strchr(line, '\n')
>
> As Christophe pointed out, this line lacks a semicolon.
> Please do not submit untested patches.
>
> > +               if (c)
> >                         *c = 0;
> >                 if (!line[0] || line[0] == '#')
> >                         continue;
> > @@ -68,7 +69,8 @@ main(void)
> >                                         fprintf(devf, "\tPRODUCT(%s,%s,\"", manuf, line+1);
> >                                         pq(devf, c);
> >                                         fputs("\")\n", devf);
> > -                               } else goto err;
> > +                               } else
> > +                                       goto err;
>
> This does not comply with Linux kernel coding style: please use braces
> in both branches.
>
> However, in this case I'd rather invert the logic, remove the braces,
> and reduce indentation for the big block:
>
>     if (strlen(line) <= 5 || line[5] != ' ')
>             goto err;
>
>     [...]
>
> >                                 break;
> >                         default:
> >                                 goto err;
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
