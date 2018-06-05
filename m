From: =?UTF-8?B?SMOla29uIEzDuHZkYWw=?= <hlovdal-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Fix atari label false positives
Date: Tue, 5 Jun 2018 22:08:39 +0200
Message-ID: <CAACXqO8f-=-Bj6JiddnQM5GMFenDUj-MBO7ZTUcPh1tAKWtTmQ@mail.gmail.com>
References: <20180605143045.23875-1-psusi@ubuntu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <parted-devel-bounces+gcgpd-parted-devel=m.gmane.org-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org>
In-Reply-To: <20180605143045.23875-1-psusi-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://alioth-lists.debian.net/cgi-bin/mailman/options/parted-devel>,
 <mailto:parted-devel-request-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org?subject=unsubscribe>
List-Archive: <http://alioth-lists.debian.net/pipermail/parted-devel/>
List-Post: <mailto:parted-devel-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org>
List-Help: <mailto:parted-devel-request-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org?subject=help>
List-Subscribe: <https://alioth-lists.debian.net/cgi-bin/mailman/listinfo/parted-devel>,
 <mailto:parted-devel-request-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org?subject=subscribe>
Errors-To: parted-devel-bounces+gcgpd-parted-devel=m.gmane.org-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org
Sender: "parted-devel"
 <parted-devel-bounces+gcgpd-parted-devel=m.gmane.org-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org>
To: Phillip Susi <psusi-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Cc: GNU Parted developers' list <parted-devel-XbBxUvOt3X2LieD7tvxI8l/i77bcL1HB@public.gmane.org>, linux-m68k-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, debian-68k-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org
List-Id: linux-m68k@vger.kernel.org

While the commit message contains the relevant information, this really
ought to be present as a comment directly in the code as well. And
the un-obviousness of the code vs check order deserves a mention as
well, so please add a commen like

+       ped_disk_atari_init (); // NB! Must be first so that it is checked last.
