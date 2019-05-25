From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] binfmt_flat: make load_flat_shared_library() work
Date: Sat, 25 May 2019 14:43:04 -0700
Message-ID: <20190525144304.e2b9475a18a1f78a964c5640@linux-foundation.org>
References: <20190524201817.16509-1-jannh@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524201817.16509-1-jannh@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jann Horn <jannh@google.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-m68k@vger.kernel.org

On Fri, 24 May 2019 22:18:17 +0200 Jann Horn <jannh@google.com> wrote:

> load_flat_shared_library() is broken: It only calls load_flat_file() if
> prepare_binprm() returns zero, but prepare_binprm() returns the number of
> bytes read - so this only happens if the file is empty.

ouch.

> Instead, call into load_flat_file() if the number of bytes read is
> non-negative. (Even if the number of bytes is zero - in that case,
> load_flat_file() will see nullbytes and return a nice -ENOEXEC.)
> 
> In addition, remove the code related to bprm creds and stop using
> prepare_binprm() - this code is loading a library, not a main executable,
> and it only actually uses the members "buf", "file" and "filename" of the
> linux_binprm struct. Instead, call kernel_read() directly.
> 
> Cc: stable@vger.kernel.org
> Fixes: 287980e49ffc ("remove lots of IS_ERR_VALUE abuses")
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
> I only found the bug by looking at the code, I have not verified its
> existence at runtime.
> Also, this patch is compile-tested only.
> It would be nice if someone who works with nommu Linux could have a
> look at this patch.

287980e49ffc was three years ago!  Has it really been broken for all
that time?  If so, it seems a good source of freed disk space...
