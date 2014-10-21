From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: [PATCH] m68k: Wire up bpf
Date: Tue, 21 Oct 2014 14:12:21 -0700
Message-ID: <CAADnVQ+5J+BM3onCUxzX+eL-gDqiJ04vDG4iD+3zbqngcmoqzQ__10380.6173465729$1413925981$gmane$org@mail.gmail.com>
References: <1413912653-3269-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1413912653-3269-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Oct 21, 2014 at 10:30 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/m68k/include/asm/unistd.h      | 2 +-
>  arch/m68k/include/uapi/asm/unistd.h | 1 +
>  arch/m68k/kernel/syscalltable.S     | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)

did the tests pass in samples/bpf/test_verifier ?
Thank you for taking care of it.
